import 'package:flutter/widgets.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoryCardsList extends StatelessWidget {
  const CategoryCardsList({
    super.key,
  });
  final List<CategoryModel> categoryItems = const [
    CategoryModel(image: 'assets/business.avif', categoryName: 'Business'),
    CategoryModel(
        image: 'assets/entertainment.jpg', categoryName: 'Entertainment'),
    CategoryModel(image: 'assets/health.jpg', categoryName: 'Health'),
    CategoryModel(
        image: 'assets/football-stadium-night-generative-ai.jpg',
        categoryName: 'Sports'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'Science'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
    CategoryModel(image: 'assets/general.avif', categoryName: 'General')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryModel: categoryItems[index],
          );
        },
      ),
    );
  }
}
