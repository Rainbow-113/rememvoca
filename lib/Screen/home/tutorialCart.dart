import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class tutorial extends StatefulWidget{
  const tutorial({super.key});
  @override
  State<tutorial> createState() => _tutorialState();
}

class _tutorialState extends State<tutorial> {
  VideoPlayerController? _controller;
  @override
  void initState(){
    super.initState();
    _controller= VideoPlayerController.networkUrl( Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),)..initialize().then((_){
      setState(() {});
    });
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
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
             Text("Cách sử dụng Falstcart 1234",style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
               color: Colors.red

             )),
           ],
         ),
         SizedBox(height:12),

           SizedBox(
             width: double.infinity,
             child: ClipRRect(
               borderRadius: BorderRadius.circular(12),
               child: _controller != null && _controller!.value.isInitialized

                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller!.value.isPlaying
                      ? _controller!.pause()
                       : _controller!.play()
                      ;});},
                   child:  AspectRatio(
                 aspectRatio: 16 / 9,
                 child: Stack(
                   alignment: Alignment.center,
                   children: [
                     VideoPlayer(_controller!),
                     if(!_controller!.value.isPlaying)
                       Container(
                         width: 52, height: 52,
                         decoration: BoxDecoration(
                           color: Colors.black45,
                           shape: BoxShape.circle,
                         ),
                         child: Icon(Icons.play_arrow,
                             color: Colors.white, size: 32),
                             )
                          ],
                        ),
                      )
                  )

                   : AspectRatio(
                 aspectRatio: 16 / 9,
                 child: Container(
                   color: Color(0xFF1a1a2e),
                   child: Center(
                     child: CircularProgressIndicator(color: Colors.white),
                   ),
                 ),
               ),
             ),
           ),
         SizedBox(height: 8),
       ],
     ),
   );
    throw UnimplementedError();
  }
}
//


