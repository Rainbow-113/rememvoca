import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/auth_provider.dart';

class welcome extends StatelessWidget{

  const welcome({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Container(
     padding: EdgeInsets.all(16),
     decoration: BoxDecoration(
       color: Color(0xFF534AB7),
       borderRadius: BorderRadius.circular(16),
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Chào ${auth.name ?? '-'}', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
         SizedBox(height: 4,),
         Text("Bạn chỉ cần 1 quyết định: bắt đầu học.",
             style: TextStyle(color: Colors.white70, fontSize: 13)),
         SizedBox(height: 14),
         Row(children: [
            _ActionBtn(icon: Icons.play_arrow ,label:  "Continue"),
           SizedBox(width: 8),
           _ActionBtn(icon: Icons.access_time, label: "5 min"),
           SizedBox(width: 8),
           _ActionBtn(icon: Icons.book, label: "10 words"),
         ],)
       ],
     ),
   );throw UnimplementedError();
  }
}

class _ActionBtn extends StatelessWidget{
  final IconData icon;
  final String label;
  const _ActionBtn({required this.icon,required this.label});
  @override
  Widget build(BuildContext context) {
  return OutlinedButton.icon(onPressed: (){},
    icon:Icon(icon,size: 14, color: Colors.white),
    label: Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
    style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.white54),
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  ),
  );throw UnimplementedError();
  }
}