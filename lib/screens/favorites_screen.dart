import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal>? _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals!.isEmpty) {
      return Center(
          child: Text('You have no favorite now - start adding some!'));
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            final Meal? meals = _favoriteMeals?[index];

            return MealItem(
              title: meals?.title ?? '',
              imageUrl: meals?.imageUrl ?? '',
              duration: meals?.duration ?? 0,
              complexity: meals?.complexity ?? Complexity.Simple,
              affordability: meals?.affordability ?? Affordability.Affordable,
              id: meals?.id ?? '',
            );
          },
          itemCount: _favoriteMeals?.length,
        );
    }
  }
}
