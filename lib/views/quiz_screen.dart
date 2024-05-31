import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizz2/models/questions_models.dart';
import 'result_screen.dart'; // Importe a ResultScreen aqui

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  final String topicName;

  const QuizScreen({
    super.key,
    required this.questions,
    required this.topicName,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool showAnswer = false;
  Timer? _timer;
  int _timeRemaining = 30;
  late Question currentQuestion;
  List<Map<String, dynamic>> quizDetails = [];

  @override
  void initState() {
    super.initState();
    currentQuestion = widget.questions[currentQuestionIndex];
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _showCorrectAnswer();
        }
      });
    });
  }

  void _showCorrectAnswer() {
    setState(() {
      showAnswer = true;
      _timer?.cancel();
    });
    Future.delayed(const Duration(seconds: 2), _nextQuestion);
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
        currentQuestion = widget.questions[currentQuestionIndex];
        showAnswer = false;
        _timeRemaining = 30;
        startTimer();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: score,
              totalQuestions: widget.questions.length,
              topicName: widget.topicName,
              quizDetails: quizDetails,
            ),
          ),
        );
      }
    });
  }

  void _answerQuestion(int selectedOptionIndex) {
    if (!showAnswer) {
      bool isCorrect = selectedOptionIndex == currentQuestion.correctOptionIndex;
      if (isCorrect) {
        score++;
      }
      quizDetails.add({
        'question': currentQuestion.questionText,
        'selectedOption': currentQuestion.options[selectedOptionIndex],
        'isCorrect': isCorrect,
        'timestamp': DateTime.now().toIso8601String(), // Add timestamp here
      });
      _showCorrectAnswer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz - ${widget.topicName}',
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
            colors: [Color(0xFFE1F396), Color(0xFFE7F0C3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pergunta ${currentQuestionIndex + 1}/${widget.questions.length}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF015055),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _timeRemaining / 30,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF015055)),
                  minHeight: 20,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentQuestion.questionText,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF222222),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ...currentQuestion.options.asMap().entries.map((entry) {
                          int idx = entry.key;
                          String option = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ElevatedButton(
                              onPressed: () => _answerQuestion(idx),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: showAnswer
                                    ? (idx == currentQuestion.correctOptionIndex
                                        ? Colors.green
                                        : Colors.red)
                                    : Color(0xFF015055),
                                foregroundColor: Colors.white,
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                option,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        }).toList(),
                        if (showAnswer)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Resposta correta: ${currentQuestion.options[currentQuestion.correctOptionIndex]}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
