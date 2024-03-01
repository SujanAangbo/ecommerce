import 'package:dio/dio.dart';
import 'package:ecommerce/core/api.dart';
import 'package:ecommerce/data/model/cart/cart_model.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_state.dart';

class CartRepository {
  Dio api = Api().instance;

  Future<List<CartModel>> getAllCartData(String userId) async {
    try {
      Response response = await api.get('/cart/$userId');
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        throw apiResponse.message.toString();
      }

      final cartList = apiResponse.body as List<dynamic>;

      return cartList.map((e) => CartModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CartModel>> addToCart(
      {required String userId,
      required String productId,
      required int quantity}) async {
    final reqBody = {
      "user": userId,
      "product": productId,
      "quantity": quantity
    };

    try {
      Response response = await api.post('/cart', data: reqBody);
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        throw apiResponse.message.toString();
      }

      final cartList = apiResponse.body as List<dynamic>;

      return cartList.map((e) => CartModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CartModel>> deleteCart(
      {required String userId, required String productId}) async {
    final reqBody = {
      "user": userId,
      "product": productId,
    };

    try {
      Response response = await api.delete('/cart', data: reqBody);
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        throw apiResponse.message.toString();
      }

      final cartList = apiResponse.body as List<dynamic>;

      return cartList.map((e) => CartModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
