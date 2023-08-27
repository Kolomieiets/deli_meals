import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/resources/dummy_data.dart';
import 'package:deli_meals/screens/categories_screen/categories_screen.dart';
import 'package:deli_meals/screens/category_meal_screen/category_meal_screen.dart';
import 'package:deli_meals/screens/filter_screen/filter_screen.dart';
import 'package:deli_meals/screens/meal_detail_screen/meal_detail.dart';
import 'package:deli_meals/widgets/tabs_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static late final VoidCallback _mainSetState;
  VoidCallback set;
  AppRouter(this.set) {
    _mainSetState = set;
  }

  static Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  static final List<Meal> _favoriteMeals = [];

  static List<Meal> _availableMeal = dummyMeals;

  static bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  static void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _availableMeal = dummyMeals.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    _mainSetState();
  }

  static void _toggleFavorite(String mealId) {
    final int existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
    }
    _mainSetState();
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => TabsScreen(_favoriteMeals),
    CategoryMealScreen.routeName: (context) =>
        CategoryMealScreen(_availableMeal),
    MealDetailScreen.routeName: (context) =>
        const MealDetailScreen(_toggleFavorite, _isMealFavorite),
    FilterScreen.routeName: (context) => FilterScreen(_filters, _setFilters),
  };

  static MaterialPageRoute<dynamic> onUnknownRoute =
      MaterialPageRoute(builder: (context) => const CategotiesScreen());
}
