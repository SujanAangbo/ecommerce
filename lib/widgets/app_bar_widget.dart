import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_text_style.dart';
import '../constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.scaffoldBackgroundColor,
      margin: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 35,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bandage",
            style: AppTextStyle.titleTextStyle,
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                size: 30,
              ),
              SizedBox(
                width: Constants.defaultPadding,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              SizedBox(
                width: Constants.defaultPadding,
              ),
              Icon(
                Icons.menu,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
