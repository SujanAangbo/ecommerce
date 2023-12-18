import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/constants.dart';
import '../../../widgets/app_secondary_button.dart';

class NeuralUniverseUI extends StatelessWidget {
  const NeuralUniverseUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Constants.defaultPadding * 8),
      color: AppColor.scaffoldBackgroundColor,
      child: Column(
        children: [
          Text(
            "Summer 2020".toUpperCase(),
            style: AppTextStyle.subtitleTextStyle
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          Text(
            "Part of the\nNeural\nUniverse",
            style: AppTextStyle.titleTextStyle.copyWith(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          Text(
            "We know how large\nobjects will act, but\nthings on a small scale.",
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          AppSecondaryButton(
            text: 'Buy Now',
            textColor: Colors.white,
            bgColor: Colors.lightBlue,
          ),
          const SizedBox(
            height: Constants.defaultPadding,
          ),
          AppSecondaryButton(
            text: 'Learn More',
            textColor: Colors.lightBlue,
            bgColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svgs/arrow_backward.xml',
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
            'assets/images/neutral_universe_bg.png',
          ),
        ],
      ),
    );
  }
}
