//lib/Shares/edit_word_dialog.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Model/word_model.dart';
import 'package:rememvoca/Provider/word_pro.dart';

void showEditWordDialog(BuildContext context, wordModel word) {
  final englishController = TextEditingController(text: word.english);
  final vietnameseController = TextEditingController(text: word.vietnamese);
  final exampleEnglishController = TextEditingController(text: word.exampleEnglish ?? "");
  final exampleVietnameseController = TextEditingController(text: word.exampleVietnamese ?? "");

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    "Sửa từ vựng",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiếng Anh
                  const Text("Tiếng Anh", style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: englishController,
                    decoration: InputDecoration(
                      hintText: "VD: Apple",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Ví dụ tiếng Anh
                  const Text("Ví dụ tiếng Anh", style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: exampleEnglishController,
                    decoration: InputDecoration(
                      hintText: "VD: I eat an apple",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tiếng Việt
                  const Text("Tiếng Việt", style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: vietnameseController,
                    decoration: InputDecoration(
                      hintText: "VD: Táo",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Ví dụ tiếng Việt
                  const Text("Ví dụ tiếng Việt", style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: exampleVietnameseController,
                    decoration: InputDecoration(
                      hintText: "VD: Tôi ăn một quả táo",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Hủy", style: TextStyle(color: Colors.black54)),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          if (englishController.text.isEmpty ||
                              vietnameseController.text.isEmpty) return;

                          final updateWord = wordModel(
                            id: word.id,
                            folderId: word.folderId,
                            english: englishController.text,
                            exampleEnglish: exampleEnglishController.text.isEmpty
                                ? null
                                : exampleEnglishController.text,
                            vietnamese: vietnameseController.text,
                            exampleVietnamese: exampleVietnameseController.text.isEmpty
                                ? null
                                : exampleVietnameseController.text,
                          );


                          if (!context.mounted) return;
                          await context.read<wordProvider>().updateWord(updateWord.id!, updateWord);

                          if (!context.mounted) return;
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text("Lưu", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}