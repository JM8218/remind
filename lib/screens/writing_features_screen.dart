import 'package:flutter/material.dart';

class WritingFeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('글쓰기 도구'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 키워드 제안
            _buildFeatureCard(
              title: '키워드 제안',
              description: '오늘의 감정과 상황에 맞는 키워드를 제안해드려요',
              icon: Icons.lightbulb_outline,
              color: Colors.orange,
              onTap: () => _showKeywordSuggestions(context),
            ),
            
            SizedBox(height: 16),
            
            // 문장 완성
            _buildFeatureCard(
              title: '문장 완성',
              description: '시작한 문장을 자연스럽게 완성해드려요',
              icon: Icons.auto_fix_high,
              color: Colors.blue,
              onTap: () => _showSentenceCompletion(context),
            ),
            
            SizedBox(height: 16),
            
            // 감정 표현 도움
            _buildFeatureCard(
              title: '감정 표현 도움',
              description: '복잡한 감정을 표현할 수 있는 단어들을 제안해요',
              icon: Icons.psychology,
              color: Colors.pink,
              onTap: () => _showEmotionExpressions(context),
            ),
            
            SizedBox(height: 16),
            
            // 질문 가이드
            _buildFeatureCard(
              title: '질문 가이드',
              description: '일기 작성에 도움되는 질문들을 제공해요',
              icon: Icons.help_outline,
              color: Colors.green,
              onTap: () => _showQuestionGuide(context),
            ),
            
            SizedBox(height: 24),
            
            // 최근 사용한 도구
            Text(
              '최근 사용한 도구',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            
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
                  _buildRecentToolItem('키워드 제안', '행복, 성취감, 만족', '2시간 전'),
                  Divider(),
                  _buildRecentToolItem('문장 완성', '오늘은... → 오늘은 정말 뜻깊은 하루였다.', '어제'),
                  Divider(),
                  _buildRecentToolItem('질문 가이드', '오늘 가장 기억에 남는 순간은?', '3일 전'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentToolItem(String tool, String content, String time) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.history, color: Colors.grey[600]),
      ),
      title: Text(
        tool,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 12,
        ),
      ),
    );
  }

  void _showKeywordSuggestions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildToolBottomSheet(
        '키워드 제안',
        ['행복', '성취감', '만족', '뿌듯함', '감사', '평온', '희망', '설렘'],
      ),
    );
  }

  void _showSentenceCompletion(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildSentenceCompletionSheet(),
    );
  }

  void _showEmotionExpressions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildToolBottomSheet(
        '감정 표현',
        ['기쁨이 넘치는', '마음이 따뜻한', '벅찬 감동의', '평화로운', '설레는', '뿌듯한'],
      ),
    );
  }

  void _showQuestionGuide(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildQuestionGuideSheet(),
    );
  }

  Widget _buildToolBottomSheet(String title, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) => Chip(
              label: Text(item),
              backgroundColor: Colors.grey[100],
            )).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSentenceCompletionSheet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '문장 완성',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: '완성하고 싶은 문장의 시작 부분을 입력하세요...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 2,
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // 문장 완성 로직
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            child: Text('문장 완성하기'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildQuestionGuideSheet() {
    final questions = [
      '오늘 가장 기억에 남는 순간은 무엇인가요?',
      '어떤 감정을 가장 많이 느꼈나요?',
      '오늘 감사했던 일이 있나요?',
      '내일은 어떤 하루가 되었으면 좋겠나요?',
      '오늘 배운 것이 있다면 무엇인가요?',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '질문 가이드',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ...questions.map((question) => Container(
            margin: EdgeInsets.only(bottom: 8),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Icon(Icons.help_outline, color: Colors.deepPurple),
              title: Text(
                question,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                // 질문 선택 로직
              },
            ),
          )).toList(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}