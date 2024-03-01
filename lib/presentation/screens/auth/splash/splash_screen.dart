import 'dart:async';
import 'dart:developer';
import 'package:ecommerce/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubid/user_cubid/user_cubid.dart';
import '../../../../logic/cubid/user_cubid/user_state.dart';
import '../../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkState(BuildContext context, UserState state) {
    log(state.toString());
    if (state is UserLoggedInState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else if (state is UserLoggedOutState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
    }
  }

  late Timer timer;

  @override
  void initState() {
    super.initState();
    log("I am inside init state");
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      UserState state = BlocProvider.of<UserCubit>(context).state;
      _checkState(context, state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (BuildContext context, UserState state) {
        _checkState(context, state);
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}
