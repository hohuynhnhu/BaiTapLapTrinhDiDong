import 'package:flutter/material.dart';

import 'page/image.dart';
import 'page/text_detail.dart';
import 'page/textFiel.dart';
import 'page/row.dart';
import 'page/column.dart';

class UIComponent extends StatelessWidget {
  const UIComponent({super.key});

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
            'UI Components List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(title: 'Display'),
          buildUIButton(context, 'Text', 'Display text', Colors.lightBlue.shade100, const Text_Detail()),
          buildUIButton(context, 'Image', 'Display image', Colors.lightBlue.shade100, const image()),

          const SectionTitle(title: 'Input'),
          buildUIButton(context, 'Text Field', 'Display text field', Colors.lightBlue.shade100, EmailCheckPage ()),
          buildUIButton(context, 'Password Field', 'Input field for passwords', Colors.lightBlue.shade100, null),

          const SectionTitle(title: 'Layout'),
          buildUIButton(context, 'Column', 'Arranges elements vertically', Colors.lightBlue.shade100, column()),
          buildUIButton(context, 'Row', 'Arranges elements horizontally', Colors.lightBlue.shade100, row()),

          buildUIButton(context, 'Tự tìm hiểu', 'Tìm ra tất cả các thành phần UI cơ bản', Colors.red.shade100, null),
        ],
      ),
    );
  }
}

/// Widget tạo ra một nút bấm UI đẹp
Widget buildUIButton(
    BuildContext context, String title, String subtitle, Color bgColor, Widget? page) {
  return GestureDetector(
    onTap: () {
      if (page != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

/// Tiêu đề của mỗi nhóm thành phần UI
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
