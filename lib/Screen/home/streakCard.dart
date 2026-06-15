import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class streakCard extends StatelessWidget {
  final List<String> days = ["T2","T3","T4","T5","T6","T7","CN"];
  final int doneCount = 3;
  final int todayIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(Icons.local_fire_department, color: Colors.orange),
                SizedBox(width: 6),
                Text("Chuỗi ngày học", style: TextStyle(fontWeight: FontWeight.w500)),
              ]),
              Text("3 ngày 🔥", style: TextStyle(color: Color(0xFF534AB7), fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 14),

          // 7 ngày
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (i) => _DayCircle(
              label: days[i],
              isDone: i < doneCount,
              isToday: i == todayIndex,
            )),
          ),
          SizedBox(height: 12),
          Divider(height: 1),
          SizedBox(height: 10),

          // Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Đã ôn: 12 từ", style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text("Còn lại: 8 từ", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}

class _DayCircle extends StatelessWidget {
  final String label;
  final bool isDone;
  final bool isToday;
  const _DayCircle({required this.label, this.isDone = false, this.isToday = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey)),
        SizedBox(height: 4),
        Container(
          width: 32, height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? Color(0xFF534AB7) : isToday ? Color(0xFFEEEDFE) : Colors.grey.shade100,
            border: isToday ? Border.all(color: Color(0xFF534AB7), width: 2) : null,
          ),
          child: Icon(
            isDone ? Icons.check : isToday ? Icons.star : null,
            size: 16,
            color: isDone ? Colors.white : Color(0xFF534AB7),
          ),
        ),
      ],
    );
  }
}