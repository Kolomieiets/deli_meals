import 'package:deli_meals/screens/categories_screen/components/category_item.dart';
import 'package:deli_meals/resources/dummy_data.dart';

import 'package:flutter/material.dart';

class CategotiesScreen extends StatelessWidget {
  const CategotiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: dummyCategories
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(),
    );
  }
}
