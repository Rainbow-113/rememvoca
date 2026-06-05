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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
              stops: [0.0, 1.0],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Folder của bạn",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mỗi folder tối đa 50 từ. Học SRS hoặc Flashcard theo folder.",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    throw UnimplementedError();
  }
}
