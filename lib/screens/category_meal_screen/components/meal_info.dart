import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealInfo extends StatelessWidget {
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  const MealInfo({
    required this.affordability,
    required this.complexity,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.schedule),
              const SizedBox(
                width: 6,
              ),
              Text('$duration min'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.work),
              const SizedBox(
                width: 6,
              ),
              Text(complexityText),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.attach_money),
              const SizedBox(
                width: 6,
              ),
              Text(affordabilityText),
            ],
          ),
        ],
      ),
    );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Expensive';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }
}
