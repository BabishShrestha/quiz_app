import 'package:quiz_app/domain/entities/category.dart';

class CategoryModel extends Quiz_Category {
  CategoryModel({required int id, required String name})
      : super(id: id, name: name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json['name']);
  }
  static List<Quiz_Category> fromData(
      List<Map<String, dynamic>> category_pool) {
    return category_pool
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'name': name,
    };
  }
}
