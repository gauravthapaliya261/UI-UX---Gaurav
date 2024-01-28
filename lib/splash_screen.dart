// splash_screen.dart

import 'package:flutter/material.dart';
import 'logo_section.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(''), // Empty text to hide the title
        centerTitle: true,
        backgroundColor: const Color(0xFF4DB87E),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFF4DB87E), // Set the background color to 4DB87E
        child: const Align(
          alignment: Alignment(0.0, -0.5), // Centered 50 pixels above the center
          child: LogoSection(
            fontColor: Colors.white,
            fontSize: 31,
          ),
        ),
      ),
    );
  }
}
