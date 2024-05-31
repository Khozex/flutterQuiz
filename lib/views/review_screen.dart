import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<Map<String, dynamic>> reviewQuestions = [];

  @override
  void initState() {
    super.initState();
    _loadReviewQuestions();
  }

  Future<void> _loadReviewQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('quiz_history') ?? [];
    DateTime now = DateTime.now();

    List<Map<String, dynamic>> filteredQuestions = [];

    for (String quizJson in history) {
      Map<String, dynamic> quiz = jsonDecode(quizJson);
      for (var detail in quiz['quizDetails']) {
        DateTime lastReviewed = DateTime.parse(detail['timestamp']);
        bool shouldReview = false;

        int score = calculateScore(detail['isCorrect'], detail['selectedOption']);
        int daysToAdd = calculateDaysToAdd(score);

        if (now.difference(lastReviewed).inDays >= daysToAdd) {
          shouldReview = true;
        }

        if (shouldReview) {
          filteredQuestions.add(detail as Map<String, dynamic>);
        }
      }
    }

    setState(() {
      reviewQuestions = filteredQuestions;
    });
  }

  int calculateScore(bool isCorrect, String? selectedOption) {
    if (isCorrect) {
      return 100;
    } else if (selectedOption == null) {
      return 0;
    } else {
      return 50;
    }
  }

  int calculateDaysToAdd(int score) {
    if (score >= 90) {
      return 7;
    } else if (score >= 75) {
      return 3;
    } else {
      return 1;
    }
  }

  void _markAsReviewed(Map<String, dynamic> questionDetail) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('quiz_history') ?? [];
    List<String> updatedHistory = history.map((quizJson) {
      Map<String, dynamic> quiz = jsonDecode(quizJson);
      quiz['quizDetails'] = quiz['quizDetails'].map((detail) {
        if (detail['question'] == questionDetail['question']) {
          detail['timestamp'] = DateTime.now().toIso8601String();
        }
        return detail;
      }).toList();
      return jsonEncode(quiz);
    }).toList();
    await prefs.setStringList('quiz_history', updatedHistory);
    _loadReviewQuestions();
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informações sobre a Revisão'),
          content: Text(
            'Nesta tela, você verá as questões que precisam ser revisadas com base no algoritmo de aprendizagem espaçada. O algoritmo determina a frequência de revisão das questões com base na sua precisão: \n\n'
            '1. Se a precisão for de 90% ou mais, a questão será revisada após 7 dias.\n'
            '2. Se a precisão for de 75% a 89%, a questão será revisada após 3 dias.\n'
            '3. Se a precisão for menor que 75%, a questão será revisada após 1 dia.\n\n'
            'Revise as questões para melhorar sua memorização e desempenho nos quizzes futuros.'
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Revisão de Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF015055),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: _showInfoDialog,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE7F0C3),
        ),
        child: ListView.builder(
          itemCount: reviewQuestions.length,
          itemBuilder: (context, index) {
            final question = reviewQuestions[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: ListTile(
                title: Text(question['question']),
                subtitle: Text(
                  'Sua resposta: ${question['selectedOption'] ?? 'Não respondida'}',
                  style: TextStyle(
                    color: question['isCorrect'] ? Colors.green : Colors.red,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () => _markAsReviewed(question),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
