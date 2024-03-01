import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/api.dart';
import 'package:ecommerce/data/model/user/user_model.dart';

class UserRepository {
  Dio api = Api().instance;

  Future<UserModel> signIn({required email, required password}) async {
    String body = jsonEncode({"email": email, "password": password});

    Response response = await api.post('/user/signIn', data: body);
    ApiResponse apiResponse = ApiResponse.fromResponse(response);

    if (!apiResponse.isSuccess) {
      throw apiResponse.message.toString();
    }

    UserModel user = UserModel.fromJson(apiResponse.body);
    return user;
  }

  Future<UserModel> signUp({required email, required password}) async {
    String body = jsonEncode({"email": email, "password": password});

    Response response = await api.post('/user/createAccount', data: body);
    ApiResponse apiResponse = ApiResponse.fromResponse(response);

    if (!apiResponse.isSuccess) {
      if (apiResponse.message is String) {
        throw apiResponse.message.toString();
      } else {
        throw "Email already used.";
      }
    }

    UserModel user = UserModel.fromJson(apiResponse.body);
    return user;
  }

  Future<UserModel> updateUser(UserModel updatedUser) async {
    String body = jsonEncode({
      'fullName': updatedUser.fullName,
      "email": updatedUser.email,
      "phoneNumber": updatedUser.phoneNumber,
      "address": updatedUser.address,
    });

    Response response = await api.put('/user/${updatedUser.sId}', data: body);
    ApiResponse apiResponse = ApiResponse.fromResponse(response);

    if (!apiResponse.isSuccess) {
      throw apiResponse.message.toString();
    }

    UserModel user = UserModel.fromJson(apiResponse.body);
    return user;
  }
}
