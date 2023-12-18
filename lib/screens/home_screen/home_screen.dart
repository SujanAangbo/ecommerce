import 'package:ecommerce/constants/app_color.dart';
import 'package:ecommerce/constants/app_text_style.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/screens/home_screen/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(child: HomeScreenBody()),
    );
  }
}
