import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  final void Function(String) onAdd;
  final void Function(String) onStudentTap;
  final List<String> students;
  final Map<String, List<String>> borrowedBooks;

  const StudentPage({
    super.key,
    required this.onAdd,
    required this.students,
    required this.onStudentTap,
    required this.borrowedBooks,
  });

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Tên sinh viên',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                widget.onAdd(_controller.text.trim());
                _controller.clear();
              }
            },
            child: const Text('Thêm sinh viên'),
          ),

          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Danh sách sinh viên:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: widget.students.isEmpty
                ? const Center(child: Text('Chưa có sinh viên nào'))
                : ListView.builder(
              itemCount: widget.students.length,
              itemBuilder: (context, index) {
                final student = widget.students[index];
                final borrowed = widget.borrowedBooks[student] ?? [];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(student),
                    subtitle: Text(
                      borrowed.isEmpty
                          ? 'Chưa mượn sách nào'
                          : 'Đã mượn: ${borrowed.join(", ")}',
                      style: const TextStyle(fontSize: 13),
                    ),
                    onTap: () => widget.onStudentTap(student),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
