import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/folder_provider.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashCart_screen.dart';
import 'package:rememvoca/Shares/Container.dart';
import 'package:rememvoca/Screen/folder/list_voca/list_screen.dart';
import 'package:rememvoca/Shares/editFolderDialog.dart';
class card extends StatefulWidget {
  final String description;
  final String folderId;
  final String folderName;
  final int totalWords;
  final int maxWords;
  const card({
    super.key,
    required this.description,
    required this.folderId,
    required this.folderName,
    required this.maxWords,
    required this.totalWords,
  });

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          boxContainer(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => list(
                          folderId: widget.folderId,
                          folderName: widget.folderName,
                        ),
                      ),
                    );
                  },
                  child:Column(children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEDFE),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.folder_outlined,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.folderName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.share,
                              color: Colors.green,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 41),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                  ),

                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F0FF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "7/50 từ",
                          style: TextStyle(
                            color: Color(0xFF6366F1),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "7 đến hạn",
                          style: TextStyle(
                            color: Color(0xFFC27A3F),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: Text(
                          "SRS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      //edit
                      GestureDetector(
                        onTap: () => showEditFolderDialog(
                          context,
                          widget.folderId,
                          widget.folderName,
                          widget.description,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.edit, color: Colors.grey, size: 15),
                        ),
                      ),
                      SizedBox(width: 3),
                      //xóa
                      GestureDetector(
                        onTap: () async {
                          // Hiện dialog xác nhận trước khi xóa
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Xóa folder"),
                              content: Text(
                                'Bạn có chắc muốn xóa "${widget.folderName}" không?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text("Hủy"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text(
                                    "Xóa",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            await context.read<folderProvider>().removeFolder(
                              widget.folderId,
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red.shade200,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //     vertical: 3,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: const Color(0xFFD1C4E9),
                      //       width: 0.8,
                      //     ),
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   child: Text(
                      //     "FlashCart",
                      //     style: TextStyle(
                      //       color: Color(0xFF7C3AED),
                      //       fontSize: 11,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );

    throw UnimplementedError();
  }
}
