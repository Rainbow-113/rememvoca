import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Model/word_model.dart';
import 'package:rememvoca/Provider/word_pro.dart';
import 'package:rememvoca/Shares/Container.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashCart_screen.dart';
import 'package:rememvoca/Shares/editWordDialog.dart';

class cart extends StatelessWidget {
  final wordModel word;

  const cart({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: boxContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần trên  tiếng Anh và tiếng Việt
            GestureDetector(
              onTap: () {
                final allWords = context.read<wordProvider>().words;
                final index = allWords.indexOf(word);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlashcardScreen(folderName: word.english, words: allWords,  initialIndex: index,),

                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word.english,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    word.vietnamese,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 10),

            // Phần dưới — mức, đến hạn và các nút
            Row(
              children: [
                // mức
                Text(
                  "mức: ",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Mới",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                // đến hạn
                Text(
                  "đến hạn: ",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  word.isDueToDay ? "Hôm nay" : word.interval,
                  style: TextStyle(
                    fontSize: 12,
                    color: word.isDueToDay ? Colors.orange : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                // edit
                GestureDetector(
                  onTap: () => showEditWordDialog(context, word),
                  child: _actionButton(Icons.edit, Colors.deepPurpleAccent),
                ),
                const SizedBox(width: 8),
                // reset
                _actionButton(Icons.restart_alt, Colors.orangeAccent),
                const SizedBox(width: 8),
                // delete
                GestureDetector(
                  onTap: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Xóa từ vựng"),
                        content: Text('Bạn có chắc muốn xóa "${word.english}" không?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text("Hủy"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                    if (confirm == true) {
                      await context.read<wordProvider>().deleteWord(word.id!, word.folderId);
                    }
                  },
                  child: _actionButton(Icons.delete, Colors.redAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color) {
    return Container(
      width: 32,
      height: 32,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: color, size: 15),
    );
  }
}
