import 'package:quiz_app/domain/entities/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CategoryLocalDataSource {
  /// Gets the cached list of [Category Model ] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<Quiz_Category>> getLoadedQuizCategory();
  Future<void> cacheQuizCategory(List<Quiz_Category> categorypool_to_cache);
}

class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  final SharedPreferences sharedPreference;

  CategoryLocalDataSourceImpl({required this.sharedPreference});

  @override
  Future<List<Quiz_Category>> getLoadedQuizCategory() {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheQuizCategory(List<Quiz_Category> categorypool_to_cache) {
    throw UnimplementedError();
  }
}
