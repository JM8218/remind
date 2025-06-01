import 'package:flutter/material.dart';

class Emotion {
  final String emoji;
  final String name;
  final Color color;

  const Emotion({
    required this.emoji,
    required this.name,
    required this.color,
  });

  static List<Emotion> get emotions => [
    Emotion(emoji: '😊', name: '행복', color: Colors.yellow),
    Emotion(emoji: '😔', name: '우울', color: Colors.blue),
    Emotion(emoji: '😠', name: '화남', color: Colors.red),
    Emotion(emoji: '😰', name: '불안', color: Colors.orange),
    Emotion(emoji: '🤗', name: '설렘', color: Colors.pink),
    Emotion(emoji: '😴', name: '피곤', color: Colors.grey),
  ];
}