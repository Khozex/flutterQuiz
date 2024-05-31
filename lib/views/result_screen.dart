import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String topicName;
  final List<Map<String, dynamic>> quizDetails;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.topicName,
    required this.quizDetails,
  });

  @override
  Widget build(BuildContext context) {
    final double accuracy = score / totalQuestions;

    _saveQuizHistory() async {
      final prefs = await SharedPreferences.getInstance();
      List<String>? history = prefs.getStringList('quiz_history') ?? [];
      Map<String, dynamic> quizResult = {
        'topicName': topicName,
        'score': score,
        'totalQuestions': totalQuestions,
        'accuracy': accuracy,
        'quizDetails': quizDetails,
      };
      history.add(jsonEncode(quizResult));
      await prefs.setStringList('quiz_history', history);
    }

    _saveQuizHistory();

    String getFeedbackMessage() {
      if (accuracy == 1.0) {
        return "Incrível! Você acertou todas!";
      } else if (accuracy >= 0.75) {
        return "Ótimo trabalho! Continue assim!";
      } else if (accuracy >= 0.5) {
        return "Bom esforço! Continue praticando!";
      } else {
        return "Não desanime! Pratique mais e tente novamente!";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultados - $topicName',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF015055),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1F396), Color(0xFF6DBE45)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Seus Resultados',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF015055),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: accuracy,
                    center: Text(
                      "${(accuracy * 100).toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF015055),
                      ),
                    ),
                    footer: Column(
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          getFeedbackMessage(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF015055),
                          ),
                        ),
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Color(0xFF6DBE45),
                    backgroundColor: Color(0xFFD32F2F),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Nos diga como você achou as questões:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF015055),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  FeedbackButtons(),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF015055),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Fechar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackButtons extends StatefulWidget {
  @override
  _FeedbackButtonsState createState() => _FeedbackButtonsState();
}

class _FeedbackButtonsState extends State<FeedbackButtons> {
  bool feedbackGiven = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFeedbackButton(context, 'Fácil'),
        _buildFeedbackButton(context, 'Médio'),
        _buildFeedbackButton(context, 'Difícil'),
      ],
    );
  }

  Widget _buildFeedbackButton(BuildContext context, String feedback) {
    return ElevatedButton(
      onPressed: feedbackGiven
          ? null
          : () {
              setState(() {
                feedbackGiven = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Feedback: $feedback enviado!'),
                ),
              );
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: feedback == 'Fácil'
            ? Color(0xFF015055)
            : feedback == 'Médio'
                ? Color(0xFFFFA726)
                : Color(0xFFD32F2F),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(feedback),
    );
  }
}
