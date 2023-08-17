import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final void Function(Map<String, bool>) saveFilters;
  Map<String,bool> currentFilters;

  FilterScreen( this.currentFilters, this.saveFilters,);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool curentValue, void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: curentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your filter'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  };
                  widget.saveFilters(selectedFilters);
                }),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal colection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Includes only gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Includes only lactose-free meals',
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Includes only vegetarian meals',
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Includes only vegan meals',
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
