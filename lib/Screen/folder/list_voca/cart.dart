import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rememvoca/Shares/Container.dart';
import 'package:rememvoca/Screen/folder/flashCart/flashCart_screen.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return boxContainer(
      child: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FlashcardScreen(folderName: "Day 1"),
                  ),
                );
              },
              child: Column(
                children: [
                  Row(children: [Text("Comma")]),
                  Row(children: [Text(",")]),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                //edit
                Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.deepPurpleAccent,
                    size: 15,
                  ),
                ),
                //Reset
                const SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.restart_alt,
                    color: Colors.orangeAccent,
                    size: 15,
                  ),
                ),
                //delete
                const SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.deepPurpleAccent,
                    size: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
