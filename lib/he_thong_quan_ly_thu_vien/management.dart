import 'package:flutter/material.dart';
import 'list_book.dart';

class LibraryManagementPage extends StatefulWidget {
  final String studentName;
  final List<String> students;
  final Map<String, List<String>> borrowedBooks;
  final Function(List<String>) onUpdate;

  const LibraryManagementPage({
    super.key,
    required this.studentName,
    required this.students,
    required this.borrowedBooks,
    required this.onUpdate,
  });

  @override
  State<LibraryManagementPage> createState() => _LibraryManagementPageState();
}

class _LibraryManagementPageState extends State<LibraryManagementPage> {
  late TextEditingController _studentController;
  late List<Map<String, dynamic>> _books;
  bool _isEditable = false;

  @override
  void initState() {
    super.initState();
    _studentController = TextEditingController(text: widget.studentName);
    _loadBooks();
  }

  void _loadBooks() {
    _books = (widget.borrowedBooks[widget.studentName] ?? [])
        .map<Map<String, dynamic>>(
          (title) => <String, dynamic>{"title": title, "selected": true},
    )
        .toList();
  }


  @override
  void didUpdateWidget(LibraryManagementPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.studentName != oldWidget.studentName) {
      _studentController.text = widget.studentName;
      setState(() {
        _loadBooks();
      });
    }
  }

  void _toggleEditMode() {
    setState(() => _isEditable = !_isEditable);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isEditable
            ? "Đã mở khóa danh sách — bạn có thể tick hoặc bỏ tick sách."
            : "Đã khóa danh sách — không thể chỉnh sửa."),
      ),
    );
  }


  void _chooseBook() async {
    final selectedBook = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookListPage()),
    );

    if (selectedBook != null && selectedBook is String) {
      setState(() {
        final exists = _books.any((b) => b["title"] == selectedBook);
        if (!exists) {
          _books.add({"title": selectedBook, "selected": true});
        }
      });
      final updatedBooks =
      _books.where((b) => b["selected"] == true).map((b) => b["title"] as String).toList();
      widget.onUpdate(updatedBooks);
    }
  }

  @override
  void dispose() {
    _studentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- Tên sinh viên ---
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _studentController,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _toggleEditMode,
                  child: Text(_isEditable ? "Khóa" : "Thay đổi"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- Danh sách sách ---
            Expanded(
              child: _books.isEmpty
                  ? const Center(child: Text("Chưa có sách nào."))
                  : ListView.builder(
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  final book = _books[index];
                  return CheckboxListTile(
                    title: Text(book["title"] ?? ""),
                    value: book["selected"] ?? false,
                    activeColor: Colors.pink,
                    onChanged: _isEditable
                        ? (value) {
                      setState(() => book["selected"] = value!);
                      final updatedBooks = _books
                          .where((b) => b["selected"] == true)
                          .map((b) => b["title"] as String)
                          .toList();
                      widget.onUpdate(updatedBooks);
                    }
                        : null,
                  );
                },
              ),
            ),

            // --- Nút thêm sách ---
            ElevatedButton(
              onPressed: _chooseBook,
              child: const Text("Thêm sách"),
            ),
          ],
        ),
      ),
    );
  }
}
