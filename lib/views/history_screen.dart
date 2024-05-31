import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> quizHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('quiz_history') ?? [];
    setState(() {
      quizHistory = history.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    });
  }

  void _showQuizDetails(Map<String, dynamic> quizDetails) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Detalhes do Quiz - ${quizDetails['topicName']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...quizDetails['quizDetails'].map<Widget>((detail) {
                bool isCorrect = detail['isCorrect'] ?? false;
                return ListTile(
                  title: Text(detail['question']),
                  subtitle: Text(
                    'Sua resposta: ${detail['selectedOption'] ?? 'Não respondida'}',
                    style: TextStyle(
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  trailing: isCorrect
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel, color: Colors.red),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histórico de Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF015055),
      ),
      body: Container(
        decoration: BoxDecoration(
         color: Color(0xFFE7F0C3),
        ),
        child: ListView.builder(
          itemCount: quizHistory.length,
          itemBuilder: (context, index) {
            final quiz = quizHistory[index];
            final accuracy = quiz['accuracy'] * 100;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('${quiz['topicName']} - ${accuracy.toStringAsFixed(1)}%'),
                  subtitle: Text('Acertos: ${quiz['score']} de ${quiz['totalQuestions']}'),
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xFF015055),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                  onTap: () => _showQuizDetails(quiz),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
