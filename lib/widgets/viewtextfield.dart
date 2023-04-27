import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomListTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 80, 80, 80),
          fontWeight: FontWeight.w200,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Color.fromARGB(255, 71, 71, 71),
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}