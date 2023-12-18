import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_color.dart';
import '../../../constants/constants.dart';
import '../../../widgets/app_button.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 800,
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            image: AssetImage(
              'assets/images/slider_background.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SUMMER 2020',
                style: TextStyle(
                    color: AppColor.scaffoldBackgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: Constants.defaultPadding * 2,
              ),
              const Text(
                'NEW\nCOLLECTION',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.scaffoldBackgroundColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
              const SizedBox(
                height: Constants.defaultPadding * 2,
              ),
              const Text(
                'We know how large objects\nwill act, but things on a\nsmall scale.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.scaffoldBackgroundColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: Constants.defaultPadding * 2,
              ),
              AppButton(
                text: "Shop Now",
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/svgs/arrow_backward.xml'),
                SvgPicture.asset('assets/svgs/arrow_forward.xml'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
