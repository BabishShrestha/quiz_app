class Quiz_Category {
  final int id;
  final String name;

  Quiz_Category({required this.id, required this.name});
  @override
  String toString() {
    return '$id ,$name ';
  }
}
