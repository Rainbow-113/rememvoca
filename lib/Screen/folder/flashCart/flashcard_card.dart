import 'dart:math';
import 'package:flutter/material.dart';

class FlashcardCard extends StatefulWidget {
  final String word;
  final String meaning;
  final String? exampleEnglish;
  final String? exampleVietnamese;
  final String hint;

  const FlashcardCard({
    super.key,
    required this.word,
    required this.meaning,
    this.exampleEnglish,
    this.exampleVietnamese,
    required this.hint,
  });

  @override
  State<FlashcardCard> createState() => _FlashcardCardState();
}

class _FlashcardCardState extends State<FlashcardCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isFlipped = !_isFlipped;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * pi;
          final showBack = angle > pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: showBack
                ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(pi),
              child: _buildBack(),
            )
                : _buildFront(),
          );
        },
      ),
    );
  }

  // Mặt trước — chỉ tiếng Anh
  Widget _buildFront() {
    return _cardShell(
      color: Colors.white,
      child: Column(
        children: [
          _iconRow(),
          const SizedBox(height: 40),
          Text(
            widget.word,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            widget.hint,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Mặt sau — tiếng Việt + 2 ví dụ
  Widget _buildBack() {
    return _cardShell(
      color: const Color(0xFFF0EEFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _iconRow(),
          const SizedBox(height: 24),

          // Nghĩa tiếng Việt
          Center(
            child: Text(
              widget.meaning,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF534AB7),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Ví dụ tiếng Anh
          if (widget.exampleEnglish != null &&
              widget.exampleEnglish!.isNotEmpty) ...[
            _exampleLabel("Ví dụ (EN)"),
            const SizedBox(height: 4),
            _exampleText(widget.exampleEnglish!, Colors.black87),
            const SizedBox(height: 12),
          ],

          // Ví dụ tiếng Việt
          if (widget.exampleVietnamese != null &&
              widget.exampleVietnamese!.isNotEmpty) ...[
            _exampleLabel("Ví dụ (VI)"),
            const SizedBox(height: 4),
            _exampleText(widget.exampleVietnamese!, Colors.black54),
          ],

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _cardShell({required Color color, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(1, 4)),
        ],
      ),
      child: child,
    );
  }

  Widget _iconRow() {
    return Row(
      children: [
        _iconBox(Icons.volume_up_outlined, Colors.grey.shade600),
        const SizedBox(width: 8),
        _iconBox(Icons.edit_outlined, const Color(0xFF534AB7)),
      ],
    );
  }

  Widget _iconBox(IconData icon, Color color) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _exampleLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade500,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _exampleText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: color,
        fontStyle: FontStyle.italic,
        height: 1.4,
      ),
    );
  }
}