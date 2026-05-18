import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class tutorial extends StatelessWidget{
  const tutorial({super.key});
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(16),
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(16),
       border: Border.all(color: Colors.grey.shade200),
     ),
     child: Column(
       children: [
         Row(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Icon(Icons.play_circle_fill_outlined ,color: Colors.red,),
             SizedBox(width: 9,),
             Text("Cách sử dụng Falstcart",style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500
             )),
           ],
         ),
         Row(
            children: [

            ],
         )
       ],
     ),
   );
    throw UnimplementedError();
  }
}
//

