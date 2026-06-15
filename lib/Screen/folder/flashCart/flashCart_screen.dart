import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rememvoca/Model/word_model.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashcard_card.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashcard_header.dart';

class FlashcardScreen extends StatefulWidget {
  final String folderName;
  final List<wordModel> words;
  final int initialIndex;
  const FlashcardScreen({super.key,  this.initialIndex=0,required this.folderName,required this.words});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late int  _current ;
  bool _isEN = true;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
  }
  @override
  Widget build(BuildContext context) {
    final wordModel currentWord = widget.words[_current];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              FlashcardHeader(
                current: _current + 1,
                total:  widget.words.length,
                folderName: widget.folderName,
                isEN: _isEN,
              ),
              SizedBox(height: 16),
              // Card
              FlashcardCard(
                word: currentWord.english,
                meaning: currentWord.vietnamese,
                exampleEnglish: currentWord.exampleEnglish,       // ← thêm
                exampleVietnamese: currentWord.exampleVietnamese, // ← thêm
                hint: "Chạm vào thẻ để xem nghĩa",

              ),
            ],
          ),
        ),
      ),
    );
  }
}
