import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/category_model.dart';

abstract class QuizLocalDataSource {
  /// Gets the cached list of [Category Model ] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CategoryModel> getQuizCategory();
  Future<void> cacheQuizCategory(List<CategoryModel> categorypoolToCache);
}

class QuizLocalDataSourceImpl extends QuizLocalDataSource {
  final SharedPreferences sharedPreference;

  final String _Cached_Quiz_Category = 'CACHED_QUIZ_CATEGORY';

  QuizLocalDataSourceImpl({required this.sharedPreference});

  @override
  Future<CategoryModel> getQuizCategory() {
    final jsonString = sharedPreference.getString(_Cached_Quiz_Category);
    if (jsonString != null) {
      return Future.value(CategoryModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> cacheQuizCategory(List<CategoryModel> categorypoolToCache) {
    return sharedPreference.setString(_Cached_Quiz_Category,
        jsonEncode(categorypoolToCache.map((category) => category.toJson())));
  }
}
