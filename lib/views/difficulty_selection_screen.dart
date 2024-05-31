import 'package:flutter/material.dart';
import 'package:quizz2/models/flutter_topics_model.dart';
import 'package:quizz2/views/cards_screen.dart';

class DifficultySelectionScreen extends StatelessWidget {
  final FlutterTopics topic;

  const DifficultySelectionScreen({required this.topic, super.key});

  void _navigateToQuizScreen(BuildContext context, int moduleNumber) {
    final filteredQuestions = topic.questions.where((q) => q.moduleNumber == moduleNumber).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardScreen(
          questions: filteredQuestions,
          topicName: topic.topicName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${topic.topicName} - Selecionar Dificuldade',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6DBE45), Color(0xFF56A14D)], // Gradiente de verdes
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xFFE7F0C3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Escolha a dificuldade para ${topic.topicName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF262A4B),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Três níveis de dificuldade
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToQuizScreen(context, index + 1);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF262A4B),
                            size: 40,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Módulo ${index + 1}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF262A4B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
