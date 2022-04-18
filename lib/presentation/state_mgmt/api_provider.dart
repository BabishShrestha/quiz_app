import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../data/data_sources/quiz_remote_data_source.dart';
import '../../domain/entities/category.dart';

final apiProvider = Provider<CategoryRemoteDataSourceImpl>(
    (ref) => CategoryRemoteDataSourceImpl(client: http.Client()));

final category_valueProvider = FutureProvider<List<Quiz_Category>>(
    (ref) async => await ref.read(apiProvider).getCategoryItem());
