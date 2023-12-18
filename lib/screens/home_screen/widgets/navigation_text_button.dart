import 'package:flutter/material.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/constants.dart';

class NavigationTextButton extends StatelessWidget {
  const NavigationTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80, bottom: 80),
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Home",
              style: AppTextStyle.subtitleTextStyle,
            ),
          ),
          const SizedBox(
            height: Constants.defaultPadding / 2,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Product",
              style: AppTextStyle.subtitleTextStyle,
            ),
          ),
          const SizedBox(
            height: Constants.defaultPadding / 2,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Pricing",
              style: AppTextStyle.subtitleTextStyle,
            ),
          ),
          const SizedBox(
            height: Constants.defaultPadding / 2,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Contact",
              style: AppTextStyle.subtitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
