import 'package:flutter/material.dart';

class row extends StatelessWidget {
  const row({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Row Layout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(3, (rowIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (colIndex) {
                // Chọn màu dựa vào cột
                Color boxColor;
                if (colIndex == 1) {
                  boxColor = Colors.blue.shade800;
                } else {
                  boxColor = Colors.blue.shade200;
                }

                return Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
