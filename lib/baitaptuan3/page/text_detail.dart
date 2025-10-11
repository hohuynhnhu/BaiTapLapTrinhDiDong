import 'package:flutter/material.dart';

class Text_Detail extends StatelessWidget {
  const Text_Detail({super.key});

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
            'Text Detail',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                height: 1.5, // khoảng cách dòng
              ),
              children: [
                TextSpan(text: 'The '),
                TextSpan(
                  text: 'quick',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: ' Brown',
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                TextSpan(text: '\nfox j u m p s '),
                TextSpan(
                  text: 'over',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(text: 'the '),
                TextSpan(
                  text: 'lazy',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: ' dog.',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
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
