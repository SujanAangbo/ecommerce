import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/constants.dart';
import '../../../widgets/app_button.dart';

class VitaClassicProductUI extends StatelessWidget {
  const VitaClassicProductUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Constants.defaultPadding * 8),
      color: AppColor.secondaryBackgroundColor,
      child: Column(
        children: [
          Text(
            "Summer 2020".toUpperCase(),
            style: AppTextStyle.titleTextStyle
                .copyWith(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          Text(
            "Vita Classic\nProduct",
            style: AppTextStyle.titleTextStyle
                .copyWith(fontSize: 32, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          Text(
            "We know how large objects\nwill act, but things on a\nsmall scale.",
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white),
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          Text(
            "\$16.48",
            style: AppTextStyle.titleTextStyle.copyWith(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svgs/arrow_backward.xml',
                ),
                AppButton(
                  text: "Add to Cart",
                ),
                SvgPicture.asset(
                  'assets/svgs/arrow_forward.xml',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Constants.defaultPadding,
          ),
          Image.asset(
            'assets/images/vita_classic_bg.png',
          ),
        ],
      ),
    );
  }
}
