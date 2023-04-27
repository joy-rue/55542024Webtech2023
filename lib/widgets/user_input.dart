import 'package:flutter/material.dart';

/**
 * User Input is a sizedBox that takes user input, and the hintText of choice  
 */
class UserInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const UserInput({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16.0),
        )
      ),
    );
  }
}
