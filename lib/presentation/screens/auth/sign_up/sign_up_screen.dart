import 'package:ecommerce/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:ecommerce/presentation/screens/auth/sign_up/sign_up_provider.dart';
import 'package:ecommerce/presentation/utils/validators.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/form_title_text.dart';
import '../../../widgets/link_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signUp';

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
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
              key: signUpProvider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyles.heading2,
                  ),
                  const GapWidget(),
                  signUpProvider.message != ""
                      ? Text(
                          signUpProvider.message,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const SizedBox(),
                  const FormTitleText(text: "Email"),
                  TextFormField(
                    controller: signUpProvider.emailController,
                    validator: Validators.validateEmail,
                    decoration: customDecoration(
                      "Enter email",
                      "email",
                    ),
                  ),
                  const GapWidget(),
                  const FormTitleText(text: "Password"),
                  TextFormField(
                    controller: signUpProvider.passwordController,
                    validator: Validators.validatePassword,
                    obscureText: true,
                    decoration: customDecoration(
                      " Enter Password",
                      "password",
                    ),
                  ),
                  const GapWidget(),
                  const FormTitleText(text: "Confirm Password"),
                  TextFormField(
                    controller: signUpProvider.cPasswordController,
                    obscureText: true,
                    validator: (value) {
                      return Validators.validateConfirmPassword(
                          value, signUpProvider.passwordController.text);
                    },
                    decoration: customDecoration(
                      "Confirm Password",
                      "password",
                    ),
                  ),
                  const GapWidget(),
                  DefaultButton(
                    text: signUpProvider.isLoading ? "..." : 'Sign Up',
                    onPressed: signUpProvider.signUp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      LinkButton(
                        text: "Sign In",
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
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
    );
  }
}
