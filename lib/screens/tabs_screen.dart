import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/favorites_screen.dart';
import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal>? _favoriteMeals;

  TabsScreen(this._favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategotiesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget._favoriteMeals), 'title': 'Your favorite'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
