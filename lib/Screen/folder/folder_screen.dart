import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class folder_screen extends StatelessWidget{
  const folder_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Expanded(
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: 150, color: Colors.yellow),
                  Container(height: 150, color: Colors.blue),
                  Container(height: 150, color: Colors.green),
                  Container(height: 150, color: Colors.yellow),
                  Container(height: 150, color: Colors.pink),
                  Container(height: 150, color: Colors.amber),
                  Container(height: 150, color: Colors.black38),
                  Container(height: 150, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),

    );

  }

}