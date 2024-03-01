import 'package:ecommerce/logic/cubid/cart_cubid/cart_cubid.dart';
import 'package:ecommerce/presentation/screens/category/category_screen.dart';
import 'package:ecommerce/presentation/screens/feed/feed_screen.dart';
import 'package:ecommerce/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubid/cart_cubid/cart_state.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = [
    FeedScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  final appbarTitle = [
    "Home",
    "Categories",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle[currentIndex]),
        actions: [
          appbarTitle[currentIndex] == "Home"
              ? IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  icon: BlocBuilder<CartCubid, CartState>(
                      builder: (context, state) {
                    return Badge(
                      isLabelVisible: state is CartLoadingState ? false : true,
                      label: Text(state.cartList.length.toString()),
                      child: const Icon(Icons.shopping_cart_outlined),
                    );
                  }),
                )
              : const SizedBox(),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
