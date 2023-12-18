import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Color(0x11737373),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Text(
          'Made With Love By\nFinland All Right Reserved ',
          textAlign: TextAlign.center,
          style: AppTextStyle.subtitleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
