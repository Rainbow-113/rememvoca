import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/folder_provider.dart';

void showEditFolderDialog(
    BuildContext context,
    String folderId,
    String folderName,
    String description,
    ) {
  final titleController = TextEditingController(text: folderName);
  final descController = TextEditingController(text: description);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        "Sửa folder",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ô tên folder
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Tên folder...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Ô description
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: descController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Mô tả folder...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Hủy", style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
          onPressed: () async {
            final error = await context.read<folderProvider>().updateFolder(
              folderId,
              titleController.text,
              descController.text,
            );

            Navigator.pop(context);

            if (error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Lỗi: $error"),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Cập nhật thành công!"),
                  backgroundColor: Color(0xFF6366F1),
                ),
              );
            }
          },
          child: Text(
            "Lưu",
            style: TextStyle(
              color: Color(0xFF6366F1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}