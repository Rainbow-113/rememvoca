import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/folder_provider.dart';
import 'package:rememvoca/Screen/home/home_screen.dart';
import 'package:rememvoca/Shares/layoutmain.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => folderProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const layOutMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}
