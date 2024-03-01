import 'package:dio/dio.dart';
import 'package:ecommerce/core/api.dart';
import 'package:ecommerce/data/model/product/product_model.dart';

class ProductRepository {
  Dio _dio = Api().instance;

  Future<List<ProductModel>> fetchAllProducts() async {
    Response response = await _dio.get('/product');

    ApiResponse apiResponse = ApiResponse.fromResponse(response);

    if (!apiResponse.isSuccess) {
      throw apiResponse.message.toString();
    }

    return (apiResponse.body as List<dynamic>)
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
  }

  Future<List<ProductModel>> fetchProductByCategory(String categoryId) async {
    Response response = await _dio.get('/product/category/$categoryId');

    ApiResponse apiResponse = ApiResponse.fromResponse(response);

    if (!apiResponse.isSuccess) {
      throw apiResponse.message.toString();
    }

    return (apiResponse.body as List<dynamic>)
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
  }
}
