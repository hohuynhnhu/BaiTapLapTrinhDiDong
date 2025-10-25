import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List<String> books = ["Sách 01", "Sách 02", "Sách 03", "Sách 04"];
  String? selectedBook; // chỉ chọn 1 sách

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách sách"),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final isSelected = selectedBook == book;

          return Card(
            color: isSelected ? Colors.pink[50] : Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: RadioListTile<String>(
              title: Text(book),
              value: book,
              groupValue: selectedBook,
              activeColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  selectedBook = value;
                });

                Navigator.pop(context, value); // ✅ dùng value trực tiếp
              },

            ),
          );
        },
      ),
    );
  }
}
