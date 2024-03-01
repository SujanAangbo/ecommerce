import 'package:flutter/material.dart';

class FormTitleText extends StatelessWidget {
  final String text;

  const FormTitleText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
