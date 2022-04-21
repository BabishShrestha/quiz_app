import 'package:quiz_app/data/data_sources/quiz_local_data_source.dart';
import 'package:quiz_app/data/data_sources/quiz_remote_data_source.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/domain/repository/quiz_repository.dart';

import '../../domain/entities/questions.dart';

class QuizRepositoryImpl extends QuizRepository {
  final QuizRemoteDataSource quizRemoteDataSource;
  final QuizLocalDataSource quizLocalDataSource;

  QuizRepositoryImpl(
      {required this.quizRemoteDataSource, required this.quizLocalDataSource});

  @override
  Future<List<Quiz_Category>> getQuizCategory() async {
    final remotecategory = await quizRemoteDataSource.getCategoryItem();
    quizLocalDataSource.cacheQuizCategory(remotecategory);
  }

  @override
  Future<List<Questions>> getQuestions(
      Quiz_Category category, String difficulty) async {
    final remotequestions =
        await quizRemoteDataSource.getQuestions(category, difficulty);
    return remotequestions;
  }
}
