import 'package:dio/dio.dart';
import 'package:ecommerce/data/model/order/order_model.dart';
import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:ecommerce/logic/services/utils.dart';

import '../../core/api.dart';
import '../model/cart/cart_model.dart';

class OrderRepository {
  final api = Api().instance;

  Future<List<OrderModel>> fetchAllOrders(String userId) async {
    try {
      Response response = await api.get('/order/$userId');

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.body as List<dynamic>)
          .map((order) => OrderModel.fromJson(order))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderModel> bookOrder(
    UserModel user,
    List<CartModel> items,
    String status,
  ) async {
    final body = {
      'user': user.toJson(),
      'items': items.map((e) => e.toJson()).toList(),
      'status': status,
      'totalAmount': Utils.totalCartCost(items),
    };

    try {
      Response response = await api.post('/order', data: body);

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        throw apiResponse.message.toString();
      }

      // return (apiResponse.body['data'])
      //     .map((order) => OrderModel.fromJson(order))
      //     .toList();
      // print('result $response');
      print('response ${apiResponse.body}');
      return OrderModel.fromJson(apiResponse.body);
    } catch (e) {
      rethrow;
    }
  }

// Future<OrderModel> updateOrder(OrderModel newOrder) async {
//   final body = {
//     'orderId': newOrder.sid,
//     'status': newOrder.status,
//   };
//
//   try {
//     Response response = await api.put('/order/updateStatus', data: body);
//
//     ApiResponse apiResponse = ApiResponse.fromResponse(response);
//
//     if (!apiResponse.isSuccess) {
//       throw apiResponse.message.toString();
//     }
//
//     // return (apiResponse.body['data'])
//     //     .map((order) => OrderModel.fromJson(order))
//     //     .toList();
//     // print('result $response');
//     print('response ${apiResponse.body}');
//     return OrderModel.fromJson(apiResponse.body);
//   } catch (e) {
//     rethrow;
//   }
// }
}
