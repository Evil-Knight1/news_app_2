import 'package:flutter/material.dart';
import 'package:news_app_2/models/category_model.dart';
import 'package:news_app_2/views/category_view.dart';

class CategoryList extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryList({
    required this.categoryModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryView(category:categoryModel.text ,),),);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(categoryModel.imagePath))),
          child: Center(
            child: Text(
              categoryModel.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )),
    );
  }
}
