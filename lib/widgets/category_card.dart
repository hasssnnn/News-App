import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

import '../pages/category_view.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CategoryView(
              category: categoryModel.categoryName,
            );
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 140,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(categoryModel.image),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              Container(
                color:
                    Colors.black.withOpacity(.1),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    categoryModel.categoryName,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


