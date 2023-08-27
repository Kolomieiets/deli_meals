import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/category_meal_screen/components/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal>? _favoriteMeals;

  const FavoritesScreen(this._favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals!.isEmpty) {
      return const Center(
          child: Text('You have no favorite now - start adding some!'));
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            final Meal? meals = _favoriteMeals?[index];

            return MealItem(
              title: meals?.title ?? '',
              imageUrl: meals?.imageUrl ?? '',
              duration: meals?.duration ?? 0,
              complexity: meals?.complexity ?? Complexity.simple,
              affordability: meals?.affordability ?? Affordability.affordable,
              id: meals?.id ?? '',
            );
          },
          itemCount: _favoriteMeals?.length,
        );
    }
  }
}
