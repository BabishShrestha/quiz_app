import 'package:quiz_app/domain/entities/questions.dart';

class QuestionModel extends Questions {
  QuestionModel(
      {required String category,
      required String type,
      required String difficulty,
      required String question,
      required String correctanswer,
      required List<dynamic> incorrectanswers})
      : super(
            category: category,
            type: type,
            difficulty: difficulty,
            question: question,
            correctanswer: correctanswer,
            incorrectanswers: incorrectanswers);

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        category: json['category'],
        difficulty: json['difficulty'],
        type: json['type'],
        incorrectanswers: json['incorrect_answers'],
        correctanswer: json['correct_answer'],
        question: json['question']);
  }
  static List<Questions> fromData(List<Map<String, dynamic>> question_pool) {
    return question_pool
        .map((question) => QuestionModel.fromJson(question))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'category': category,
    };
  }
}
