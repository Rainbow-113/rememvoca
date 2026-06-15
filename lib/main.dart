import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/auth_provider.dart';
import 'package:rememvoca/Provider/folder_provider.dart';
import 'package:rememvoca/Provider/word_pro.dart';
import 'package:rememvoca/Screen/home/home_screen.dart';
import 'package:rememvoca/Screen/login_screen.dart';
import 'package:rememvoca/Screen/register_screen.dart';
import 'package:rememvoca/Shares/layoutmain.dart';
import 'package:rememvoca/Widget/auth_wrapper.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => folderProvider()),
        ChangeNotifierProvider(create: (_) => wordProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AuthWrapper(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const layOutMain(),
      },
    );
  }
}
