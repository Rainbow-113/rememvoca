import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Model/folder_model.dart';
import 'package:rememvoca/Screen/folder/card.dart';
import 'package:rememvoca/Screen/folder/head.dart';
import 'package:rememvoca/Screen/folder/search.dart';
import 'package:rememvoca/Services/folder_service.dart';
import 'package:rememvoca/Provider/folder_provider.dart';

class folder_screen extends StatefulWidget {
  final String folderName;
  const folder_screen({super.key, required this.folderName});

  @override
  State<folder_screen> createState() => _folder_screenState();
}

class _folder_screenState extends State<folder_screen> {
  List<folderModel> _folders = [];
  bool _isLoading = true;
  String _error = '';
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<folderProvider>().loadFolders();
    });
    // _loadFolders();
  }

  // Future<void> _loadFolders() async {
  //   try {
  //     final folders = await folderService.getFolders();
  //     setState(() {
  //       _folders = folders;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _error = e.toString();
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            head(),
            SizedBox(height: 12),
            search(),
            SizedBox(height: 12),
            Consumer<folderProvider>(
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
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.folders.length,
                  itemBuilder: (context, index) {
                    final folder = provider.folders[index];
                    return card(
                      folderName: folder.title,
                      maxWords: folder.maxWords,
                      totalWords: folder.totalWords,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
