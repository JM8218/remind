import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(EmotionDiaryApp());
}

class EmotionDiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '감정 회고 일기',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'NotoSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}