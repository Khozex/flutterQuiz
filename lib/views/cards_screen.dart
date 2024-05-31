import 'package:flutter/material.dart';
import 'package:quizz2/models/questions_models.dart';
import 'package:quizz2/views/quiz_screen.dart';
import 'dart:math';

class CardScreen extends StatefulWidget {
  final List<Question> questions;
  final String topicName;

  const CardScreen({
    super.key,
    required this.questions,
    required this.topicName,
  });

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;
  bool showAnswer = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
        showAnswer = false;
        _controller.reset();
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        showAnswer = false;
        _controller.reset();
      }
    });
  }

  void _toggleAnswer() {
    setState(() {
      showAnswer = !showAnswer;
      if (showAnswer) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _startQuiz() {
    final random = Random();
    final selectedQuestions = (widget.questions.toList()..shuffle(random)).take(4).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          questions: selectedQuestions,
          topicName: widget.topicName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz - ${widget.topicName}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF015055), // Usando a paleta de cores fornecida
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
              Expanded(
                child: GestureDetector(
                  onTap: _toggleAnswer,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        final isFront = _animation.value < 0.5;
                        final childToShow = isFront
                            ? Container(
                                key: ValueKey<bool>(isFront),
                                width: double.infinity,
                                height: 400,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1F396),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      currentQuestion.questionText,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF222222),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                key: ValueKey<bool>(!isFront),
                                width: double.infinity,
                                height: 400,
                                decoration: BoxDecoration(
                                  color: Color(0xFF015055),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(3.1415926535897932),
                                    child: Text(
                                      currentQuestion.options[currentQuestion.correctOptionIndex],
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );

                        return Transform(
                          transform: Matrix4.rotationY(_animation.value * 3.1415926535897932),
                          alignment: Alignment.center,
                          child: childToShow,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0 ? _previousQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentQuestionIndex > 0 ? Color(0xFF015055) : Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Pergunta Anterior'),
                  ),
                  ElevatedButton(
                    onPressed: currentQuestionIndex < widget.questions.length - 1 ? _nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentQuestionIndex < widget.questions.length - 1 ? Color(0xFF015055) : Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Próxima Pergunta'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _startQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF015055),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Iniciar Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
