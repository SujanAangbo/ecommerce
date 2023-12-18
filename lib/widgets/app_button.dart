import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/constants.dart';

class AppButton extends StatelessWidget {
  String text;
  AppButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () {},
      color: Colors.green,
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.defaultPadding * 2,
        vertical: Constants.defaultPadding / 2,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.scaffoldBackgroundColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
