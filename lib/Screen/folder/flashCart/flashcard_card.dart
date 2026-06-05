import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashcardCard extends StatelessWidget {
  final String word;
  final String hint;
  final bool isFlipped;
  final VoidCallback onTap;

  const FlashcardCard({
    super.key,
    required this.word,
    required this.hint,
    required this.isFlipped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(1, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Icon âm thanh + edit
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.volume_up_outlined,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF534AB7),
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),

            // Từ chính
            Text(
              word,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // Gợi ý
            Text(
              hint,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
