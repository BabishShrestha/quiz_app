import 'package:quiz_app/domain/entities/category.dart';

abstract class QuizRepository {
  Future<List<Quiz_Category>> getQuizCategory();
}
