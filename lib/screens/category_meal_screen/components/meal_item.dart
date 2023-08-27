import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/category_meal_screen/components/meal_info.dart';
import 'package:deli_meals/screens/category_meal_screen/components/meal_title.dart';
import 'package:deli_meals/screens/meal_detail_screen/meal_detail.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.title,
    required this.affordability,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                    child: Image(
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl,
                      ),
                    )),
                MealTitle(title: title),
              ],
            ),
            MealInfo(
              complexity: complexity,
              affordability: affordability,
              duration: duration,
            ),
          ],
        ),
      ),
    );
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }
}
