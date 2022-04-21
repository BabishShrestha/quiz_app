import 'package:quiz_app/data/model/category_model.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/domain/entities/questions.dart';

abstract class QuizRepository {
  Future<List<CategoryModel>> getQuizCategory();
  Future<List<Questions>> getQuestions(
      Quiz_Category category, String difficulty);
}
