import 'dart:math';
import 'dart:ui';

import 'package:ecommerce/constants/app_color.dart';
import 'package:ecommerce/data/bestseller_product.dart';
import 'package:ecommerce/data/editor_category.dart';
import 'package:ecommerce/data/featured_product.dart';
import 'package:ecommerce/screens/home_screen/widgets/slider_image.dart';
import 'package:ecommerce/screens/home_screen/widgets/vita_classic_product_ui.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/constants.dart';
import '../../../widgets/about_us_section.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_footer.dart';
import '../../../widgets/social_icons.dart';
import 'best_seller_product_ui.dart';
import 'editors_pick_ui.dart';
import 'navigation_text_button.dart';
import 'neural_universe_ui.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarWidget(),
          // navigation text ui
          const NavigationTextButton(),

          // slider image with data
          SliderImage(),

          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),

          // Editors pick ui
          EditorsPickUI(),

          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),

          // Best seller product ui
          BestSellerProductUI(),

          // vita classic product
          VitaClassicProductUI(),

          // neural universe ui
          NeuralUniverseUI(),

          // featured products
          Container(
            padding: const EdgeInsets.only(top: Constants.defaultPadding * 8),
            color: AppColor.scaffoldBackgroundColor,
            child: Column(
              children: [
                Text(
                  "Practice Advice",
                  style: AppTextStyle.subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),
                Text(
                  "Featured\nProducts",
                  style: AppTextStyle.titleTextStyle.copyWith(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),
                Text(
                  "Problems trying to resolve the\nconflict between the two major",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.titleTextStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding * 2,
                ),
                ListView.builder(
                  itemCount: featuredProduct.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // feature product card
                    return FeatureProductCard(
                      index: index,
                    );
                  },
                )
              ],
            ),
          ),

          // socials icons
          const SocialIcons(),
          AboutUsSection(),
          AppFooter(),
        ],
      ),
    );
  }
}

class FeatureProductCard extends StatelessWidget {
  int index;
  FeatureProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: const RoundedRectangleBorder(),
      margin: const EdgeInsets.all(Constants.defaultPadding),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            featuredProduct[index]['image'].toString()))),
              ),
              Positioned(
                top: 25,
                left: 25,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 35,
                  width: 50,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: const Text(
                    "New",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: Constants.defaultPadding,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.builder(

                      // shrinkWrap: true,

                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        List<String> keywords =
                            featuredProduct[0]['keyword'] as List<String>;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            keywords[index],
                          ),
                        );
                      }),
                ),
                Text(
                  featuredProduct[index]['title'].toString(),
                  textAlign: TextAlign.start,
                  style: AppTextStyle.titleTextStyle
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  featuredProduct[index]['description'].toString(),
                  style: AppTextStyle.subtitleTextStyle
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.alarm,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          featuredProduct[index]['date'].toString(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.area_chart,
                          color: AppColor.secondaryBackgroundColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${featuredProduct[index]['comment']} comment",
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),
                Row(
                  children: [
                    Text(
                      "Learn More",
                      style: AppTextStyle.subtitleTextStyle
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  ],
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
