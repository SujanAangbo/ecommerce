import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_text_style.dart';
import '../constants/constants.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Bandage",
            style: AppTextStyle.titleTextStyle,
          ),
          const SizedBox(
            height: Constants.defaultPadding * 1.5,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/svgs/facebook.xml'),
              const SizedBox(
                width: Constants.defaultPadding,
              ),
              SvgPicture.asset('assets/svgs/instagram.xml'),
              const SizedBox(
                width: Constants.defaultPadding,
              ),
              SvgPicture.asset('assets/svgs/twitter.xml'),
            ],
          ),
          const SizedBox(
            height: Constants.defaultPadding * 1.5,
          ),
        ],
      ),
    );
  }
}
