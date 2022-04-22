import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/data/model/category_model.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/domain/entities/questions.dart';

import '../model/question_model.dart';

abstract class QuizRemoteDataSource {
  /// Calls the https://opentdb.com/api_category.php endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Quiz_Category>> getCategoryItem();

  /// Calls the https://opentdb.com/api.php?amount=10 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Questions>> getQuestions(
      Quiz_Category category, String? difficulty);
}

class QuizRemoteDataSourceImpl extends QuizRemoteDataSource {
  final http.Client client;

  QuizRemoteDataSourceImpl({required this.client});
  @override
  Future<List<Quiz_Category>> getCategoryItem() {
    return _getCategoryFromURL("https://opentdb.com/api_category.php");
  }

  Future<List<Quiz_Category>> _getCategoryFromURL(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> categoryPool = List<Map<String, dynamic>>.from(
          jsonDecode(response.body)['trivia_categories']);

      return CategoryModel.fromData(categoryPool);
    } else {
      throw UnimplementedError(response.reasonPhrase);
    }
  }

  @override
  Future<List<Questions>> getQuestions(
      Quiz_Category category, String? difficulty) {
    String url =
        "https://opentdb.com/api.php?amount=10&category=${category.id}";
    if (difficulty != null) {
      url = "$url&difficulty=$difficulty";
    }

    return getQuestionFromURL(url);
  }

  Future<List<Questions>> getQuestionFromURL(String url) async {
    //gets response from API
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> questionPool =
          List<Map<String, dynamic>>.from(jsonDecode(response.body)['results']);
      return QuestionModel.fromData(questionPool);
    } else {
      throw UnimplementedError(response.reasonPhrase);
    }
  }
}
