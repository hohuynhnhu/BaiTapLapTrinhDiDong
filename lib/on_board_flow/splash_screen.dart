import 'package:flutter/material.dart';
import 'get_started_first.dart';

class spashScreen extends StatelessWidget {
  const spashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Khi chạm toàn màn hình thì chuyển trang
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GetStart()),
          );
        },
        child: Container(
          color: Colors.white, // giúp GestureDetector nhận tap toàn màn hình
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hình ảnh ở giữa
              Center(
                child: Image.asset(
                  'assets/logouth.png',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // Text ở dưới hình
              const Text(
                'UTH SmartTasks',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // Gợi ý chạm màn hình
              // const Text(
              //   'Chạm để tiếp tục',
              //   style: TextStyle(fontSize: 16, color: Colors.grey),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
