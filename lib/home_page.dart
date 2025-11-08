import 'package:flutter/material.dart';
import 'package:laptrinhdidong/baitaptuan3/ui_basic.dart';
import 'package:laptrinhdidong/he_thong_quan_ly_thu_vien/main_sach.dart';
import 'baitaptuan2/screen_week2.dart';
import 'baitaptuan3/screen_week3.dart';
import 'on_board_flow/splash_screen.dart';
import 'dataFlow/enterEmail.dart';
import 'loginFirebase/loginFirebase.dart';
import 'product_detail/productDetailScreen.dart';
import 'baitaptuan7/home_screen.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weeks = [
      {'title': 'Tuần 2', 'page': const Week1Screen()},
      {'title': 'Tuần 3', 'page': const screem_week3()},
      {'title': 'Bài tập ui cơ bản', 'page': const UiBasic()},
      {'title': 'Tuần 5-Task Managemt', 'page': const spashScreen()},
      {'title': 'Hệ thống quản lý thư viện', 'page': const MainBook()},
      {'title': 'Data Flow', 'page': const EnterEmailPage()},
      {'title': 'Login Firebase', 'page': LoginScreen()},
      {'title': 'Product Detail', 'page': const ProductDetailPage()},
      {'title': 'Tuần 6: Gọi API', 'page': HomeScreen()},
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
