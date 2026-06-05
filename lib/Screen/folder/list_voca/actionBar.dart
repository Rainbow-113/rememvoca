import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class actionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "SRS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),

              // Nút Flashcard
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_book_outlined,
                          color: Colors.grey.shade600,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Flashcard",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),

              // Nút Xóa
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red.shade400,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Xóa",
                          style: TextStyle(color: Colors.red.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Thanh tìm kiếm + filter
          Row(
            children: [
              // Ô tìm kiếm
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Tìm từ...",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      isDense: true,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),

              // Nút Filter
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Icon(
                  Icons.filter_list,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
