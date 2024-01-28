// logo_section.dart

import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  final Color fontColor; // New parameter to set the font color
  final double fontSize;

  const LogoSection({super.key, required this.fontColor, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0), // Adjust top padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.meeting_room, // Use the Material Icons room
            size: 80.0,
            color: fontColor,
          ),
          const SizedBox(width: 10.0),
          Text(
            'Find Me A Room',
            style: TextStyle(
              fontFamily: 'Langar',
              fontSize: fontSize,
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
