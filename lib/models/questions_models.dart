class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final int moduleNumber;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.moduleNumber,
  });
}
