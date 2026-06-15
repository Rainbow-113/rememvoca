import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashcardHeader extends StatelessWidget {
  final int current;
  final int total;
  final String folderName;
  final bool isEN;

  const FlashcardHeader({
    super.key,
    required this.current,
    required this.total,
    required this.folderName,
    required this.isEN,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Hàng tiêu đề
        Row(
          children: [
            Text(
              "Flashcard",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),

            // Badge 9/9
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFFEEEDFE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "$current/$total",
                style: TextStyle(fontSize: 12, color: Color(0xFF534AB7)),
              ),
            ),
            SizedBox(width: 8),

            // Badge Folder
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFF534AB7)),
              ),
              child: Text(
                "Order: $current",
                style: TextStyle(fontSize: 12, color: Color(0xFF534AB7)),
              ),
            ),
            Spacer(),

            // Toggle EN/VI
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B6FE8), Color(0xFF534AB7)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isEN ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "EN",
                      style: TextStyle(
                        color: isEN ? Color(0xFF534AB7) : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: !isEN ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "VI",
                      style: TextStyle(
                        color: !isEN ? Color(0xFF534AB7) : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        //Nút quay lại
        Align(alignment: Alignment.centerLeft,
        child:
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 14,
              ),
              SizedBox(width: 6),
              Text(
                "Quay lại",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),),
        SizedBox(height: 8),
        // Thanh tiến trình

        LinearProgressIndicator(
          value: current / total,
          backgroundColor: Colors.grey.shade200,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF534AB7)),
          minHeight: 4,
          borderRadius: BorderRadius.circular(2),
        ),

      ],
    );

  }
}
