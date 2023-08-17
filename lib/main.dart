import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/category_meal_screen.dart';
import 'package:deli_meals/screens/filter_screen.dart';
import 'package:deli_meals/screens/meal_detail.dart';
import 'package:deli_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
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
    });
  }

  void _toggleFavorite(String mealId) {
    final int existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    setState(() {});
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: const CategotiesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, isMealFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => const CategotiesScreen());
      },
    );
  }
}
