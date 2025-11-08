import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tasks = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final url = Uri.parse('https://amock.io/api/researchUTH/tasks');
      final response = await http.get(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // SỬA LỖI: Lấy từ 'data' thay vì 'tasks'
        if (data['isSuccess'] == true) {
          setState(() {
            tasks = data['data'] ?? []; // ← SỬA Ở ĐÂY
            isLoading = false;
            error = '';
          });
        } else {
          setState(() {
            tasks = [];
            isLoading = false;
            error = data['message'] ?? 'Unknown error';
          });
        }
      } else {
        setState(() {
          tasks = [];
          isLoading = false;
          error = 'HTTP Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        tasks = [];
        isLoading = false;
        error = 'Exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('List')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Thêm hiển thị lỗi
    if (error.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('List')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 80, color: Colors.red),
              SizedBox(height: 16),
              Text('Error: $error', style: TextStyle(fontSize: 16, color: Colors.red)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: fetchTasks,
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (tasks.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('List')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment_turned_in_outlined, size: 80, color: Colors.grey),
              SizedBox(height: 16),
              Text('No Tasks Yet!', style: TextStyle(fontSize: 18, color: Colors.grey)),
              SizedBox(height: 8),
              Text('Stay productive—add something to do', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            color: Colors.primaries[index % Colors.primaries.length].shade100,
            child: ListTile(
              title: Text(task['title']?.toString() ?? 'No title'),
              subtitle: Text(task['description']?.toString() ?? ''),
              trailing: Text('Status: ${task['status']?.toString() ?? ''}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(taskData: task),
                  ),
                ).then((value) {
                  if (value == true) {
                    fetchTasks(); // Refresh khi quay lại
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}