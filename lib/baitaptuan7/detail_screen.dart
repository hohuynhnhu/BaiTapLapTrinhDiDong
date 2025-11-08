import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> taskData; // ← Nhận data từ HomeScreen

  const DetailScreen({required this.taskData});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<void> deleteTask() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Xác nhận'),
        content: Text('Bạn có chắc chắn muốn xóa task này không?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Hủy')
          ),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Xóa', style: TextStyle(color: Colors.red))
          ),
        ],
      ),
    );

    if (confirm == true) {
      // Giả lập xóa thành công (vì API thật không hoạt động)
      await Future.delayed(Duration(milliseconds: 500));
      Navigator.pop(context, true); // trả về true để refresh list

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đã xóa task (giả lập)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.taskData; // Sử dụng data được truyền vào

    return Scaffold(
      appBar: AppBar(
        title: Text(task['title']?.toString() ?? 'Detail'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleteTask,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin cơ bản
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task['title']?.toString() ?? 'No title',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(task['description']?.toString() ?? 'No description'),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          _buildInfoItem('Category', task['category']),
                          SizedBox(width: 16),
                          _buildInfoItem('Status', task['status']),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          _buildInfoItem('Priority', task['priority']),
                          SizedBox(width: 16),
                          _buildInfoItem('Due Date', _formatDate(task['dueDate'])),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          _buildInfoItem('Created', _formatDate(task['createdAt'])),
                          SizedBox(width: 16),
                          _buildInfoItem('Updated', _formatDate(task['updatedAt'])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Subtasks
              if ((task['subtasks'] ?? []).isNotEmpty) ...[
                Text('Subtasks:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: List<Widget>.from(
                        (task['subtasks'] ?? []).map<Widget>((subtask) {
                          return Row(
                            children: [
                              Checkbox(
                                value: subtask['isCompleted'] ?? false,
                                onChanged: null,
                              ),
                              Expanded(
                                child: Text(
                                  subtask['title']?.toString() ?? '',
                                  style: TextStyle(
                                    decoration: (subtask['isCompleted'] ?? false)
                                        ? TextDecoration.lineThrough
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
              Card(
                color: Colors.orange[50],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Colors.orange),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'API chi tiết task không khả dụng. Đang hiển thị dữ liệu từ danh sách.',
                          style: TextStyle(color: Colors.orange[800]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, dynamic value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          SizedBox(height: 4),
          Text(value?.toString() ?? 'N/A', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }
}