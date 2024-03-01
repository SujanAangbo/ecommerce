import 'package:ecommerce/logic/cubid/user_cubid/user_cubid.dart';
import 'package:ecommerce/presentation/widgets/default_button.dart';
import 'package:ecommerce/presentation/widgets/form_title_text.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles.dart';
import '../../../data/model/user/user_model.dart';
import '../../utils/validators.dart';

class EditProfileScreen extends StatelessWidget {
  UserModel user;

  EditProfileScreen({super.key, required this.user}) {
    nameController = TextEditingController(text: user.fullName);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.phoneNumber);
    addressController = TextEditingController(text: user.address);
  }

  static const String routeName = '/edit_profile';

  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormTitleText(text: 'Name'),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                decoration: customDecoration(
                  "Enter Name",
                  "name",
                ),
              ),
              const GapWidget(),
              const FormTitleText(text: 'Email'),
              TextFormField(
                controller: emailController,
                validator: Validators.validateEmail,
                decoration: customDecoration(
                  "Enter email",
                  "name",
                ),
              ),
              const GapWidget(),
              const FormTitleText(text: 'Phone Number'),
              TextFormField(
                controller: phoneNumberController,
                validator: (value) {
                  if (value == null) {
                    return 'Phone number Cannot be empty';
                  } else if (value.trim().length != 10) {
                    return 'Phone number must be of 10 digits';
                  }
                  return null;
                },
                decoration: customDecoration(
                  "Enter phone number",
                  "name",
                ),
              ),
              const GapWidget(),
              const FormTitleText(text: 'Address'),
              TextFormField(
                controller: addressController,
                validator: (value) {
                  if (value == null) {
                    return 'Address Cannot be empty';
                  }
                  return null;
                },
                decoration: customDecoration(
                  "Enter address",
                  "name",
                ),
              ),
              const GapWidget(),
              const GapWidget(),
              DefaultButton(
                text: "Update",
                onPressed: () {
                  user.fullName = nameController.text;
                  user.email = emailController.text;
                  user.phoneNumber = phoneNumberController.text;
                  user.address = addressController.text;

                  BlocProvider.of<UserCubit>(context).updateUser(user);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
