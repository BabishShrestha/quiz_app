import 'package:quiz_app/data/data_sources/quiz_remote_data_source.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/domain/repository/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  QuizRepositoryImpl({required this.categoryRemoteDataSource});

  @override
  Future<List<Quiz_Category>> getQuizCategory() async {
    return await categoryRemoteDataSource.getCategoryItem();
  }
}
