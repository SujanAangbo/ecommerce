import 'package:ecommerce/presentation/screens/auth/sign_in/sign_in_provider.dart';
import 'package:ecommerce/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce/presentation/screens/auth/splash/splash_screen.dart';
import 'package:ecommerce/presentation/utils/validators.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../../../../core/styles.dart';
import '../../../../logic/cubid/user_cubid/user_cubid.dart';
import '../../../../logic/cubid/user_cubid/user_state.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/form_title_text.dart';
import '../../../widgets/gap_widget.dart';
import '../../home/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String routeName = '/signIn';

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);

    return BlocListener<UserCubit, UserState>(
      listener: (BuildContext context, UserState state) {
        if (state is UserLoggedInState) {
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ecommerce App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: signInProvider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyles.heading2,
                    ),
                    const GapWidget(),
                    BlocBuilder(
                        bloc: BlocProvider.of<UserCubit>(context),
                        builder: (context, state) {
                          if (state is UserErrorState) {
                            return Text(
                              state.message,
                              style: const TextStyle(color: Colors.red),
                            );
                          }
                          return const SizedBox();
                        }),
                    const FormTitleText(text: "Email"),
                    TextFormField(
                      controller: signInProvider.emailController,
                      validator: Validators.validateEmail,
                      decoration: customDecoration(
                        "Enter email",
                        "email",
                      ),
                    ),
                    const GapWidget(),
                    const FormTitleText(text: "Password"),
                    TextFormField(
                      controller: signInProvider.passwordController,
                      validator: Validators.validatePassword,
                      obscureText: true,
                      decoration: customDecoration(
                        " Enter Password",
                        "password",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LinkButton(text: "Forget Password", onPressed: () {}),
                      ],
                    ),
                    DefaultButton(
                      text: 'Login',
                      onPressed: signInProvider.signIn,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        LinkButton(
                          text: "Sign Up",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
