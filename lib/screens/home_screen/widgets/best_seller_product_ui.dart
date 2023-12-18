import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/constants.dart';
import '../../../data/bestseller_product.dart';

class BestSellerProductUI extends StatelessWidget {
  const BestSellerProductUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: Constants.defaultPadding * 2,
      ),
      child: Column(
        children: [
          const Text("Featured Products",
              style: AppTextStyle.subtitleTextStyle),
          const SizedBox(
            height: Constants.defaultPadding / 2,
          ),
          Text(
            "BestSeller\nProducts".toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle,
          ),
          const SizedBox(
            height: Constants.defaultPadding / 2,
          ),
          Text(
            "Problems trying to resolve\nthe conflict between",
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitleTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: Constants.defaultPadding * 2,
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: bestsellerProduct.length,
            itemBuilder: (context, index) {
              return BestSellerProductCard(
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class BestSellerProductCard extends StatelessWidget {
  int index;
  BestSellerProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(bestsellerProduct[index]['image'].toString()),
          const SizedBox(
            height: Constants.defaultPadding,
          ),
          Text(
            bestsellerProduct[index]['title'].toString(),
            style: AppTextStyle.titleTextStyle.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: Constants.defaultPadding / 2,
          ),
          Text(
            bestsellerProduct[index]['description'].toString(),
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: Constants.defaultPadding / 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${bestsellerProduct[index]['price'].toString()}',
                style: AppTextStyle.subtitleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(
                width: Constants.defaultPadding / 4,
              ),
              Text(
                '\$${bestsellerProduct[index]['discount_price'].toString()}',
                style: AppTextStyle.titleTextStyle
                    .copyWith(fontSize: 18, color: AppColor.secondaryTextColor),
              ),
            ],
          ),
          const SizedBox(
            height: Constants.defaultPadding / 4,
          ),
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: 15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, i) {
                List<Color> colors =
                    bestsellerProduct[index]['color'] as List<Color>;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: colors[i],
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
