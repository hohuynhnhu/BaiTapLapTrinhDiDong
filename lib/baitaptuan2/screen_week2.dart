import 'package:flutter/material.dart';
import 'bai_number.dart';
import 'enter_name_age.dart';
import 'enter_email.dart';
// import 'bai4.dart';

class Week1Screen extends StatelessWidget {
  const Week1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Danh sách bài tập: mỗi phần tử là Map<String, dynamic>
    final List<Map<String, dynamic>> exercises = [
      {'title': 'Bài 1: Nhập số nguyên dương', 'page': const Bai1Screen()},
      {'title': 'Bài 2: Nhập Tên & Tuổi', 'page': const baithuchanh1()},
      {'title': 'Bài 3: Nhập email', 'page': const EmailCheckPage()},
      // {'title': 'Bài 4: Hiển thị thông tin cá nhân', 'page': const Bai4Screen()},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Bài Tập tuần 2',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                ex['title'], // 🔸 Không cần dấu ! vì có kiểu rõ ràng rồi
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ex['page']),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
