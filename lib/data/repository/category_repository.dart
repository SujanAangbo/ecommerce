import 'package:dio/dio.dart';
import 'package:ecommerce/core/api.dart';
import 'package:ecommerce/data/model/category/category_model.dart';
import 'package:flutter/material.dart';

class CategoryRepository {
  final Dio _api = Api().instance;

  Future<List<CategoryModel>> fetchAllCategory() async {
    try {
      Response response = await _api.get('/category');
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        if (apiResponse.message is String) {
          throw apiResponse.message.toString();
        }

        throw "Cannot get category";
      }

      List<dynamic> result = apiResponse.body as List<dynamic>;
      return result.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
