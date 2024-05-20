import 'package:flutter/material.dart';
import 'package:news_app_2/components/category_list.dart';
import 'package:news_app_2/models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return  CategoryList(
              categoryModel:categories[index]);
        });
  }
  final List<CategoryModel> categories = const [
    CategoryModel(imagePath: 'assets/business.avif' ,text:'business' ),
    CategoryModel(imagePath: 'assets/entertainment.avif' ,text:'entertainment' ),
    CategoryModel(imagePath: 'assets/general.avif' ,text:'general' ),
    CategoryModel(imagePath: 'assets/health.avif' ,text:'health' ),
    CategoryModel(imagePath: 'assets/sports.avif' ,text:'sports' ),
    CategoryModel(imagePath: 'assets/science.jpg' ,text:'science' ),
    CategoryModel(imagePath: 'assets/technology.jpeg' ,text:'technology' ),
  ];
}
