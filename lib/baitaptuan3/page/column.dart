import 'package:flutter/material.dart';

class column extends StatelessWidget {
  const column ({super.key});

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
            'Column Layout',
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
              children: List.generate(1, (colIndex) {
                Color boxColor;
                if (rowIndex == 1) {
                  boxColor = Colors.teal.shade800;
                } else {
                  boxColor = Colors.teal.shade200;
                }

                return Container(
                  height: 200,
                  width: 400,
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
