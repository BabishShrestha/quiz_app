class Questions {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctanswer;
  final List<dynamic> incorrectanswers;

  Questions(
      {required this.category,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.correctanswer,
      required this.incorrectanswers});
}
