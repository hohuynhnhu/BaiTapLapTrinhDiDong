import 'package:flutter/material.dart';
import 'student.dart';
import 'management.dart';
import 'list_book.dart';

class MainBook extends StatefulWidget {
  const MainBook({super.key});

  @override
  State<MainBook> createState() => _MainBookState();
}

class _MainBookState extends State<MainBook> {
  int _selectedIndex = 0;
  String _selectedStudent = '';
  final List<String> _students = [];
  final Map<String, List<String>> _borrowedBooks = {};

  void _addStudent(String name) {
    setState(() {
      if (name.trim().isNotEmpty && !_students.contains(name.trim())) {
        _students.add(name.trim());
        _selectedStudent = name.trim();
      }
    });
  }

  void _openLibraryForStudent(String name) {
    setState(() {
      _selectedStudent = name;
      _selectedIndex = 0;
    });
  }

  void _updateBorrowedBooks(List<String> books) {
    if (_selectedStudent.isNotEmpty) {
      setState(() {
        _borrowedBooks[_selectedStudent] = books;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return LibraryManagementPage(
          studentName: _selectedStudent,
          students: _students,
          borrowedBooks: _borrowedBooks,
          onUpdate: _updateBorrowedBooks,
        );
      case 1:
        return const BookListPage();
      case 2:
        return StudentPage(
          students: _students,
          borrowedBooks: _borrowedBooks,
          onAdd: _addStudent,
          onStudentTap: _openLibraryForStudent,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống Quản lý Thư viện"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'DS Sách'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Sinh viên'),
        ],
      ),
    );
  }
}
