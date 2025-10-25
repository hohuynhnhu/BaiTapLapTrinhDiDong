import 'package:flutter/material.dart';
import 'ui_compoment_list.dart';

class screem_week3 extends StatelessWidget {
  const screem_week3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text(
            'Hồ Huỳnh Nhu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '2251120433',
            style: TextStyle(fontSize: 14, color: Colors.black38),

          ),
          ],
          ),// canh trái

        ),

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hình ảnh to ở giữa
          Center(
            child: Image.asset(
              'assets/nen.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

          // Text ở dưới hình
          const Text(
            'Jetpack Compose',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          const Text(
            'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Nút ở cuối
           ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UIComponent()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Colors.blue,
            ),
            child: const Text('Bắt đầu', style: TextStyle(fontSize: 18,color: Colors.white)),
          ),
        ],
      ),
    );
  }
}