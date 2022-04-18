import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/data/model/category_model.dart';
import 'package:quiz_app/domain/entities/category.dart';

abstract class CategoryRemoteDataSource {
  /// Calls the https://opentdb.com/api_category.php endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Quiz_Category>> getCategoryItem();
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final http.Client client;

  CategoryRemoteDataSourceImpl({required this.client});
  @override
  Future<List<Quiz_Category>> getCategoryItem() {
    return _getCategoryFromURL("https://opentdb.com/api_category.php");
  }

  Future<List<Quiz_Category>> _getCategoryFromURL(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> category_pool =
          List<Map<String, dynamic>>.from(
              jsonDecode(response.body)['trivia_categories']);

      return CategoryModel.fromData(category_pool);
    } else {
      throw UnimplementedError(response.reasonPhrase);
    }
  }
}
