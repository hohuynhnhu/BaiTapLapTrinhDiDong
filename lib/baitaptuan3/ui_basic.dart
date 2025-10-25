import 'package:flutter/material.dart';

class UiBasic extends StatelessWidget {
  const UiBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // căn giữa nội dung
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "My First App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text("I'm", style: TextStyle(fontSize: 20),),
              const Text(
                "Ho Huynh Nhu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // hành động khi nhấn nút
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Welcome!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Say hi!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
