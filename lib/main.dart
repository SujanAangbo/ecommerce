import 'dart:developer';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_cubid.dart';
import 'package:ecommerce/logic/cubid/category_cubid/category_cubid.dart';
import 'package:ecommerce/logic/cubid/home_cubid/home_cubid.dart';
import 'package:ecommerce/logic/cubid/order_cubid/order_cubid.dart';
import 'package:ecommerce/presentation/screens/auth/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubid/user_cubid/user_cubid.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CategoryCubid(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeCubid(),
        ),
        BlocProvider(
          create: (BuildContext context) => CartCubid(context),
        ),
        BlocProvider(
          create: (BuildContext context) => OrderCubid(context),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade500),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log('$bloc created');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log('$bloc destroyed');
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log('change from $bloc to $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('$error error on $bloc');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
  }
}
