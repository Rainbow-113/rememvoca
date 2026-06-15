import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/word_pro.dart';
import 'package:rememvoca/Screen/folder/folder_screen.dart';
import 'package:rememvoca/Screen/folder/list_voca//head.dart';
import 'package:rememvoca/Screen/folder/list_voca/actionBar.dart';
import 'package:rememvoca/Screen/folder/list_voca/add.dart';
import 'package:rememvoca/Screen/folder/list_voca/cart.dart';
import 'package:rememvoca/Screen/home/home_screen.dart';
import 'package:rememvoca/Screen/playlist/playlist_screen.dart';
import 'package:rememvoca/Screen/setting/setting_screen.dart';

class list extends StatefulWidget {
  final String folderId;
  final String folderName;

  const list({super.key, required this.folderName, required this.folderId});
  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  void initState() {
    super.initState();
    Future.microtask(() {
      print("folderId: ${widget.folderId}");
      context.read<wordProvider>().loadWords(widget.folderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            head(folderName: widget.folderName),
            SizedBox(height: 12),
            actionBar(),
            SizedBox(height: 12),
            Consumer<wordProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: Color(0xFF534AB7)),
                  );
                }
                if (provider.error.isNotEmpty) {
                  return Center(
                    child: Text(
                      'Lỗi: ${provider.error}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (provider.words.isEmpty) {
                  return Center(child: Text('Chưa có từ vựng nào!'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.words.length,
                  itemBuilder: (context, index) {
                    return cart(word: provider.words[index]);
                  },
                );
              },
            ),
            SizedBox(height: 12),
            AddCardButtons(folderId: widget.folderId,),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
