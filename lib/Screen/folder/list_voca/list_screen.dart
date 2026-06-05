import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rememvoca/Screen/folder/folder_screen.dart';
import 'package:rememvoca/Screen/folder/list_voca//head.dart';
import 'package:rememvoca/Screen/folder/list_voca/actionBar.dart';
import 'package:rememvoca/Screen/folder/list_voca/add.dart';
import 'package:rememvoca/Screen/folder/list_voca/cart.dart';
import 'package:rememvoca/Screen/home/home_screen.dart';
import 'package:rememvoca/Screen/playlist/playlist_screen.dart';
import 'package:rememvoca/Screen/setting/setting_screen.dart';

class list extends StatefulWidget {
  final String folderName;

  const list({super.key, required this.folderName});
  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  int _selectedIndex = 0;
  List<Widget> get _pages => [
    home_screem(
      onTabChange: (index) {
        setState(() => _selectedIndex = index);
      },
    ),
    const folder_screen(folderName: "day1"),
    const playlist_screem(),
    const setting_screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            head(),
            SizedBox(height: 12),
            actionBar(),
            SizedBox(height: 12),

            SizedBox(height: 12),
            AddCardButtons(),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
