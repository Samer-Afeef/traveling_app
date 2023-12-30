import 'package:flutter/material.dart';
import 'package:traveling/widgets/category_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        children: categoriesData.map((categoryData) => CategoryItem(imageUrl: categoryData.imageUrl, title:categoryData.title,id: categoryData.id,)).toList()

    );
  }
}
