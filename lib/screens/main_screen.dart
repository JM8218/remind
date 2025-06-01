import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'emotion_analysis_screen.dart';
import 'auto_reflection_screen.dart';
import 'writing_features_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    EmotionAnalysisScreen(),
    AutoReflectionScreen(),
    WritingFeaturesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology),
            label: '감정 분석',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: '자동 회고',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '글쓰기 도구',
          ),
        ],
      ),
    );
  }
}