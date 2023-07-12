// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final bool obsecureText;
  String? myText;
  final TextEditingController myController;
  MyTextBox({
    Key? key,
    required this.obsecureText,
    this.myText,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: obsecureText,
        controller: myController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: myText!,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade700),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
