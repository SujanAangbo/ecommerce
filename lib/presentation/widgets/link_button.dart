import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  String text;
  Function() onPressed;

  LinkButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      minWidth: double.minPositive,
      onPressed: onPressed,
      textColor: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
