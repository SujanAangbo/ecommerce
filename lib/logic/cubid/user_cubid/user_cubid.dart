import 'dart:developer';
import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:ecommerce/data/repository/user_repository.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_state.dart';
import 'package:ecommerce/logic/services/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialState()) {
    _checkUserLoggedIn();
  }

  UserRepository userRepository = UserRepository();

  _checkUserLoggedIn() async {
    Map<String, dynamic> userData = await Preferences.getUserData();
    String? email = userData['email'];
    String? password = userData['password'];

    print("email: $email, password: $password");

    if (email == null || password == null) {
      emit(UserLoggedOutState());
      return;
    }

    login(email: email, password: password);
  }

  _emitLoggedInState({
    required String email,
    required String password,
    required UserModel user,
  }) {
    log("I am here");
    Preferences.saveUserData(email: email, password: password);
    emit(UserLoggedInState(user: user));
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(UserLoadingState());

    try {
      UserModel user =
          await userRepository.signIn(email: email, password: password);
      _emitLoggedInState(email: email, password: password, user: user);
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  void register({
    required String email,
    required String password,
  }) async {
    emit(UserLoadingState());

    try {
      UserModel user = await userRepository.signUp(
        email: email,
        password: password,
      );
      _emitLoggedInState(email: email, password: password, user: user);
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  void updateUser(UserModel updatedUser) async {
    emit(UserLoadingState());

    try {
      UserModel user = await userRepository.updateUser(updatedUser);
      emit(UserLoggedInState(user: user));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  void logout() async {
    emit(UserLoadingState());
    try {
      await Preferences.logOutUser();
      emit(UserLoggedOutState());
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
