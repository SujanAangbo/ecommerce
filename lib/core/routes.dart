import 'package:ecommerce/data/model/category/category_model.dart';
import 'package:ecommerce/data/model/product/product_model.dart';
import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:ecommerce/logic/cubid/category_product_cubid/category_product_cubid.dart';
import 'package:ecommerce/presentation/screens/auth/sign_in/sign_in_provider.dart';
import 'package:ecommerce/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:ecommerce/presentation/screens/auth/sign_up/sign_up_provider.dart';
import 'package:ecommerce/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce/presentation/screens/auth/splash/splash_screen.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/category/category_product_detail_screen.dart';
import 'package:ecommerce/presentation/screens/order/my_order_screen.dart';
import 'package:ecommerce/presentation/screens/order/order_screen.dart';
import 'package:ecommerce/presentation/screens/order/order_success_screen.dart';
import 'package:ecommerce/presentation/screens/order/provider/order_provider.dart';
import 'package:ecommerce/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce/presentation/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SignInProvider(context),
            child: const SignInScreen(),
          ),
        );

      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SignUpProvider(context: context),
            child: const SignUpScreen(),
          ),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case CartScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );

      case ProductDetailScreen.routeName:
        ProductModel product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            product: product,
          ),
        );

      case CategoryProductDetailScreen.routeName:
        Map<String, dynamic> arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => CategoryProductCubid(arg['category']),
              child: CategoryProductDetailScreen(
                categoryTitle: arg['title'],
              )),
        );

      case EditProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => EditProfileScreen(
            user: settings.arguments as UserModel,
          ),
        );

      case OrderScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => OrderProvider(),
            child: OrderScreen(),
          ),
        );

      case OrderSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const OrderSuccessScreen(),
        );

      case MyOrderScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyOrderScreen(),
        );

      default:
        return null;
    }
  }
}
