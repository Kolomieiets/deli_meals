import 'package:deli_meals/screens/filter_screen/filter_screen.dart';
import 'package:deli_meals/widgets/components/list_tile_builder.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTileBuilder(
          title: 'Meals',
          icon: Icons.restaurant,
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTileBuilder(
          title: 'Filters',
          icon: Icons.settings,
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          },
        ),
      ],
    ));
  }
}
