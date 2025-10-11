import 'package:flutter/material.dart';
import 'baitaptuan2/screen_week2.dart';
import 'baitaptuan3/screen_week3.dart';
// import 'screens/week3_screen.dart';
// import 'screens/week4_screen.dart';
// import 'screens/week5_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weeks = [
      {'title': 'Tuần 2', 'page': const Week1Screen()},
      {'title': 'Tuần 3', 'page': const screem_week3()},
      // {'title': 'Tuần 3', 'page': const Week3Screen()},
      // {'title': 'Tuần 4', 'page': const Week4Screen()},
      // {'title': 'Tuần 5', 'page': const Week5Screen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách bài thực hành'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: weeks.length,
        itemBuilder: (context, index) {
          final week = weeks[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                week['title'] as String,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => week['page'] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),

    );
  }
}
