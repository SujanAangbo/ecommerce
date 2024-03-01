import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubid/user_cubid/user_cubid.dart';
import '../../../../logic/cubid/user_cubid/user_state.dart';

class SignInProvider extends ChangeNotifier {
  BuildContext context;

  SignInProvider(this.context) {
    _listenToUserCubid();
  }

  bool isLoading = false;
  String message = '';
  StreamSubscription? userSubscription;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _listenToUserCubid() {
    userSubscription =
        BlocProvider.of<UserCubit>(context).stream.listen((state) {
      if (state is UserLoadingState) {
        isLoading = true;
        message = '';
        notifyListeners();
      } else if (state is UserLoggedInState) {
        isLoading = false;
        message = '';
        notifyListeners();
      } else if (state is UserErrorState) {
        isLoading = false;
        message = state.message;
        notifyListeners();
      }
    });
  }

  void signIn() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    BlocProvider.of<UserCubit>(context).login(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userSubscription?.cancel();
    super.dispose();
  }
}
