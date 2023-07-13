// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  void Function()? onTap;
  MyButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green.shade500),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
