import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rememvoca/Shares/create_word_dialog.dart';

class AddCardButtons extends StatelessWidget {
  final String folderId;
  const AddCardButtons({super.key , required this.folderId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showCreateWordDialog(context,folderId);
          },
          child: DottedBorder(
            color: const Color(0xFFC7D2FE),
            strokeWidth: 2,
            //strokeWidth là độ đậm của nét
            dashPattern: const [6, 4],
            //dashPattern để độ dày của nét đứt 6px và 4 px
            borderType: BorderType.RRect,
            //borderType là dùng để bo tròn
            radius: const Radius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add, color: Color(0xFF4F46E5), size: 20),
                  SizedBox(width: 6),
                  Text(
                    "Thêm thẻ mới",
                    style: TextStyle(
                      color: Color(0xFF4F46E5),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        GestureDetector(
          onTap: () {
            print("Bấm import file");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.description_outlined,
                  color: Color(0xFF10B981),
                  size: 18,
                ),
                SizedBox(width: 6),
                Text(
                  "Import từ file CSV/TXT",
                  style: TextStyle(
                    color: Color(0xFF10B981),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
