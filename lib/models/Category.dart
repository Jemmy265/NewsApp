import 'dart:ui';

class CategoryModel {
  String title;
  String imagePath;
  Color color;
  String categoryid;

  CategoryModel(
      {required this.title,
      required this.color,
      required this.imagePath,
      required this.categoryid});
}
