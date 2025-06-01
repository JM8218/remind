import 'package:flutter/material.dart';
import '../models/emotion.dart';

class WriteDiaryScreen extends StatefulWidget {
  @override
  _WriteDiaryScreenState createState() => _WriteDiaryScreenState();
}

class _WriteDiaryScreenState extends State<WriteDiaryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String selectedEmotion = '😊';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('일기 쓰기'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // 저장 로직
              Navigator.pop(context);
            },
            child: Text(
              '저장',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 감정 선택
            Text(
              '오늘의 감정',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Emotion.emotions.length,
                itemBuilder: (context, index) {
                  final emotion = Emotion.emotions[index];
                  return _buildEmotionChip(emotion.emoji, emotion.name);
                },
              ),
            ),
            SizedBox(height: 24),

            // 제목 입력
            Text(
              '제목',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: '오늘 하루를 한 줄로 표현해보세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 24),

            // 내용 입력
            Text(
              '내용',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _contentController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: '오늘 있었던 일들과 감정을 자유롭게 적어보세요...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 24),

            // 알림 스위치들
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSwitchTile('1년 전 오늘 알림', true),
                  Divider(),
                  _buildSwitchTile('주간 리포트 알림', true),
                  Divider(),
                  _buildSwitchTile('월간 리포트 알림', false),
                  Divider(),
                  _buildSwitchTile('작성 리마인드', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionChip(String emoji, String name) {
    final isSelected = selectedEmotion == emoji;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () => setState(() => selectedEmotion = emoji),
        child: Chip(
          avatar: Text(emoji, style: TextStyle(fontSize: 20)),
          label: Text(name),
          backgroundColor: isSelected
              ? Colors.deepPurple.withOpacity(0.2)
              : Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: (newValue) {
          // 스위치 상태 변경 로직
        },
        activeColor: Colors.deepPurple,
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
