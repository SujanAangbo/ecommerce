import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Company Info\n",
            style: AppTextStyle.titleTextStyle,
          ), //
          Text(
            "About Us\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Carrier\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "We are hiring\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Blog\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Legal\n",
            style: AppTextStyle.titleTextStyle,
          ), //
          Text(
            "About Us\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Carrier\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "We are hiring\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Blog\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            "Features\n",
            style: AppTextStyle.titleTextStyle,
          ), //
          Text(
            "Business Marketing\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "User Analytic\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Live Chat\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Unlimited Support\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const Text(
            "Resources\n",
            style: AppTextStyle.titleTextStyle,
          ),
          Text(
            "Ios & Android\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Watch a Demo\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Customers\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "API\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            "Get In Touch\n",
            style: AppTextStyle.titleTextStyle,
          ),
          // textfield
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x11737373),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00737373),
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          )),
                      hintText: "Your Email",
                    ),
                  ),
                ),
              ),
              MaterialButton(
                height: 60,
                onPressed: () {},
                color: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                )),
                child: Text(
                  "Subscribe",
                  style: AppTextStyle.subtitleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),

          Text(
            "We will not share your information\n",
            style: AppTextStyle.subtitleTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
