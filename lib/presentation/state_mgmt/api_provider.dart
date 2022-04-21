import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../data/data_sources/quiz_remote_data_source.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/questions.dart';

final apiProvider = Provider<QuizRemoteDataSourceImpl>(
    (ref) => QuizRemoteDataSourceImpl(client: http.Client()));

final category_valueProvider = FutureProvider<List<Quiz_Category>>(
    (ref) async => await ref.read(apiProvider).getCategoryItem());

FutureProvider<List<Questions>> QuestionValueProvider(
    Quiz_Category selectedcategory, String? difficulty) {
  return FutureProvider<List<Questions>>((ref) async => await ref
      .read(apiProvider)
      .getQuestions(selectedcategory, difficulty?.toLowerCase()));
}
