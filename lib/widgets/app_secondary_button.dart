import 'package:flutter/material.dart';

class AppSecondaryButton extends StatelessWidget {
  String text;
  Color textColor;
  Color bgColor;
  AppSecondaryButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: textColor)),
      child: MaterialButton(
        color: bgColor,
        onPressed: () {},
        child: Text(
          text.toUpperCase(),
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      ),
    );
  }
}
