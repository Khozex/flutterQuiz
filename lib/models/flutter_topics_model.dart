import 'package:flutter/material.dart';
import 'package:quizz2/models/biologia_questions.dart';
import 'package:quizz2/models/filosofia_questions.dart';
import 'package:quizz2/models/finance_questions.dart';
import 'package:quizz2/models/fisica_questions.dart';
import 'package:quizz2/models/geografia_questions.dart';
import 'package:quizz2/models/geometria_questions.dart';
import 'package:quizz2/models/historia_questions.dart';
import 'package:quizz2/models/ingles_questions.dart';
import 'package:quizz2/models/literatura_questions.dart';
import 'package:quizz2/models/matematica_questions.dart';
import 'package:quizz2/models/portugues_questions.dart';
import 'package:quizz2/models/questions_models.dart';
import 'package:quizz2/models/quimica_questions.dart';
import 'package:quizz2/models/sociologia_questions.dart';

class FlutterTopics {
  final String topicName;
  final String topicCategory;
  final List<Question> questions;
  final IconData topicIcon;

  FlutterTopics({
    required this.topicName,
    required this.topicCategory,
    required this.questions,
    required this.topicIcon,
  });
}

List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    topicName: 'Geometria',
    topicCategory: 'Matemática',
    questions: geometriaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.calculate,
  ),
  FlutterTopics(
    topicName: 'Física',
    topicCategory: 'Ciências',
    questions: fisicaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.lightbulb,
  ),
  FlutterTopics(
    topicName: 'Química',
    topicCategory: 'Ciências',
    questions: quimicaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.science,
  ),
  FlutterTopics(
    topicName: 'Matemática',
    topicCategory: 'Matemática',
    questions: matematicaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.functions,
  ),
  FlutterTopics(
    topicName: 'Biologia',
    topicCategory: 'Ciências',
    questions: biologiaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.biotech,
  ),
  FlutterTopics(
    topicName: 'História',
    topicCategory: 'Humanas',
    questions: historiaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.history_edu,
  ),
  FlutterTopics(
    topicName: 'Geografia',
    topicCategory: 'Humanas',
    questions: geografiaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.public,
  ),
  FlutterTopics(
    topicName: 'Língua Portuguesa',
    topicCategory: 'Linguagens',
    questions: portuguesQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.book,
  ),
  FlutterTopics(
    topicName: 'Literatura',
    topicCategory: 'Linguagens',
    questions: literaturaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.menu_book,
  ),
  FlutterTopics(
    topicName: 'Inglês',
    topicCategory: 'Linguagens',
    questions: inglesQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.language,
  ),
  FlutterTopics(
    topicName: 'Ensino Financeiro',
    topicCategory: 'Educação Financeira',
    questions: ensinoFinanceiroQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.attach_money,
  ),
  FlutterTopics(
    topicName: 'Filosofia',
    topicCategory: 'Humanas',
    questions: filosofiaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.psychology,
  ),
  FlutterTopics(
    topicName: 'Sociologia',
    topicCategory: 'Humanas',
    questions: sociologiaQuestions, // As questões serão importadas de um arquivo separado
    topicIcon: Icons.people,
  ),
];

