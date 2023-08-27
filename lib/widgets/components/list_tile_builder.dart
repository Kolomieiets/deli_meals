import 'package:flutter/material.dart';

class ListTileBuilder extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback tapHandler;
  const ListTileBuilder({required this.tapHandler, required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }
}
