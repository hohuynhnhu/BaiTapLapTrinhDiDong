import 'package:flutter/material.dart';

class EmailCheckPage extends StatefulWidget{
  const EmailCheckPage({super.key});

  @override
  State<EmailCheckPage> createState() => _EmailCheckPageState();
}

class _EmailCheckPageState  extends State<EmailCheckPage> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorText;
  void _checkEmail(){
    setState(() {
      String email = _emailController.text.trim();
      if (email.isEmpty) {
        _errorText = "Vui lòng nhập email";
      } else if (!email.contains("@")) {
        _errorText = "Email không đúng định dạng";
      } else {
        _errorText = null;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bài thực hành 02",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Nhập email",
                border: const OutlineInputBorder(),
                errorText: _errorText,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // 🔹 Flutter mới dùng backgroundColor
                foregroundColor: Colors.white, // 🔹 thay vì primary/onPrimary
              ),
              child: const Text("Kiểm tra"),
            ),
          ],

        ),
      ),
    );

  }
}
