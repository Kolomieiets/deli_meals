import 'package:flutter/material.dart';

class MealTitle extends StatelessWidget {
  final String title;
  const MealTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                );
  }
}