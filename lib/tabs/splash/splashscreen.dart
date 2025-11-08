
import 'dart:async';

import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:app_project_flutter/tabs/onBordingPage/onBordingScreen.dart';
import 'package:flutter/material.dart';
// Make sure this import matches your project structure

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) => onBordingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            // 👇 Slide + Fade Combo (Smooth transition)
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.5, 0.0), // Slightly from right
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: FadeTransition(
                opacity: curvedAnimation,
                child: child,
              ),
            );
          },
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/whatsapp1.png",
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            UiHelper.customText(
              text: "WhatsApp",
              fontWeight: FontWeight.bold,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}


