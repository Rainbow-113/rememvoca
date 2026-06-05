import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashcard_card.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashcard_header.dart';

class FlashcardScreen extends StatefulWidget {
  final String folderName;
  const FlashcardScreen({super.key, required this.folderName});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int _current = 1;
  int _total = 9;
  bool _isEN = true;
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              FlashcardHeader(
                current: _current,
                total: _total,
                folderName: widget.folderName,
                isEN: _isEN,
              ),
              SizedBox(height: 16),

              // Card
              FlashcardCard(
                word: "Colon",
                hint: "Chạm vào thẻ để xem nghĩa",
                isFlipped: _isFlipped,
                onTap: () {
                  setState(() => _isFlipped = !_isFlipped);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
