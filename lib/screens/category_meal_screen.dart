import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/category_meals';
  final List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final String? categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final Meal? meals = displayedMeals?[index];

            return MealItem(
              title: meals?.title ?? '',
              imageUrl: meals?.imageUrl ?? '',
              duration: meals?.duration ?? 0,
              complexity: meals?.complexity ?? Complexity.Simple,
              affordability: meals?.affordability ?? Affordability.Affordable,
              id: meals?.id ?? '',
            );
          },
          itemCount: displayedMeals?.length,
        ));
  }
}
