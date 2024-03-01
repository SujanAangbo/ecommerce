import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubid/user_cubid/user_cubid.dart';
import '../../../../logic/cubid/user_cubid/user_state.dart';

class SignUpProvider extends ChangeNotifier {
  BuildContext context;

  SignUpProvider({required this.context}) {
    _listenToUserCubid();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String message = "";

  _listenToUserCubid() {
    BlocProvider.of<UserCubit>(context).stream.listen((state) {
      if (state is UserLoadingState) {
        isLoading = true;
        message = "";
        notifyListeners();
      } else if (state is UserLoggedInState) {
        isLoading = false;
        message = "";
        notifyListeners();
      } else if (state is UserErrorState) {
        isLoading = false;
        message = state.message;
        notifyListeners();
      }
    });
  }

  void signUp() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    BlocProvider.of<UserCubit>(context).register(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
