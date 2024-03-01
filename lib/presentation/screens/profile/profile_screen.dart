import 'package:ecommerce/core/styles.dart';
import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_cubid.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_state.dart';
import 'package:ecommerce/presentation/screens/auth/splash/splash_screen.dart';
import 'package:ecommerce/presentation/screens/order/my_order_screen.dart';
import 'package:ecommerce/presentation/screens/profile/edit_profile_screen.dart';
import 'package:ecommerce/presentation/widgets/default_circular_widget.dart';
import 'package:ecommerce/presentation/widgets/default_error_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      if (state is UserLoggedOutState) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacementNamed(context, SplashScreen.routeName);
      }
    }, builder: (context, state) {
      if (state is UserLoadingState) {
        return const DefaultCircularWidget();
      } else if (state is UserErrorState) {
        return DefaultErrorWidget(message: state.message);
      } else if (state is UserLoggedInState) {
        UserModel user = state.user;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName!,
                style: TextStyles.heading2,
              ),
              Text(
                user.email!,
                style: TextStyles.body3,
              ),
              LinkButton(
                  text: 'Edit Profile',
                  onPressed: () {
                    Navigator.pushNamed(context, EditProfileScreen.routeName,
                        arguments: user);
                  }),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, MyOrderScreen.routeName);
                },
                leading: const Icon(CupertinoIcons.cube_box),
                title: const Text("My Orders"),
                contentPadding: const EdgeInsets.all(0),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Do you want to exit?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<UserCubit>(context).logout();
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                iconColor: Colors.red,
                textColor: Colors.red,
                leading: const Icon(Icons.logout),
                title: const Text("LogOut"),
                contentPadding: const EdgeInsets.all(0),
              )
            ],
          ),
        );
      }

      return const DefaultErrorWidget(message: "Something Went Wrong");
    });
  }
}
