import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class head extends StatelessWidget {
  const head({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft, // Tương ứng với góc 135deg (0%)
              end: Alignment.bottomRight, // Tương ứng với điểm đích (100%)
              colors: [
                Color(
                  0xFF6366F1,
                ), // Đổi #6366F1 sang định dạng Color của Flutter
                Color(
                  0xFF8B5CF6,
                ), // Đổi #8B5CF6 sang định dạng Color của Flutter
              ],
              stops: [0.0, 1.0], // Khớp với tỷ lệ 0% và 100%
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Folder của bạn"),
              Text(
                "Mỗi folder tối đa 50 từ. Học SRS hoặc Flashcard theo folder.",
              ),
            ],
          ),
        ),
      ],
    );

    throw UnimplementedError();
  }
}
