import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Gói nhập mã xác thực 6 ô
import 'resetPass.dart';

class VerifyCodePage extends StatelessWidget {
  final String email; // 👉 Nhận email từ trang trước

  const VerifyCodePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // Mã xác thực đúng
    const correctCode = "123456";

    // Theme cho từng ô nhập mã
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nút back
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 30),

                // Logo
                Image.asset(
                  'assets/logouth.png',
                  height: 80,
                ),
                const SizedBox(height: 16),

                // Tên ứng dụng
                const Text(
                  "SmartTasks",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 40),

                // Tiêu đề
                const Text(
                  "Verify Code",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),

                // Mô tả
                Text(
                  "Enter the 6-digit code we sent to:\n$email",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),

                // Ô nhập mã 6 ký tự
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  onCompleted: (pin) {
                    if (pin == correctCode) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("✅ Verification successful!"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // ✅ Khi đúng mã thì chuyển qua ResetPasswordPage và TRUYỀN EMAIL
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordPage(email: email),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("❌ Invalid verification code!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 30),

                // Nút Next (nếu muốn bỏ qua nhập mã)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordPage(email: email),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
