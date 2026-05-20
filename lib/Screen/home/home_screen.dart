import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rememvoca/Screen/home/streakCard.dart';
import 'package:rememvoca/Screen/home/tutorialCart.dart';
import 'package:rememvoca/Screen/home/welcomeCard.dart';

class home_screem extends StatelessWidget{
  const home_screem({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:SingleChildScrollView(
       padding: EdgeInsets.all(14),
       child: Column(
         children: [
           welcome(),
           SizedBox(height: 12),
            streakCard(),
           SizedBox(height: 12),
              tutorial()
         ],
       ),
     )

   );
  }

}