import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/auth_provider.dart';
import 'package:rememvoca/Screen/login_screen.dart';
import 'package:rememvoca/Screen/home/home_screen.dart';
import 'package:rememvoca/Shares/layoutmain.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.watch<AuthProvider>().status;

    switch (status) {


      case AuthStatus.initial:
        return const _SplashScreen();

    //
      case AuthStatus.authenticated:
        return const layOutMain();

    //
      case AuthStatus.unauthenticated:
      case AuthStatus.error:
      case AuthStatus.loading:
        return const LoginScreen();
    }
  }
}


class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'RememVoca',
              style: TextStyle(
                color:         Color(0xFF7C6FCD),
                fontSize:      24,
                fontWeight:    FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width:  20,
              height: 20,
              child: CircularProgressIndicator(
                color:       Color(0xFF7C6FCD),
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}