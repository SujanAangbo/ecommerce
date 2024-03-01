import 'package:ecommerce/data/model/user/user_model.dart';

abstract class UserState {}

class InitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoggedInState extends UserState {
  UserModel user;

  UserLoggedInState({required this.user});
}

class UserLoggedOutState extends UserState {}

class UserErrorState extends UserState {
  String message;

  UserErrorState(this.message);
}
