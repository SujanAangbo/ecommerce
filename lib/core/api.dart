import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "http://192.168.1.66:5000/api";
const Map<String, String> URL_HEADER = {'Content-Type': 'application/json'};

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.headers = URL_HEADER;
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  Dio get instance => _dio;
}

class ApiResponse {
  bool isSuccess;
  dynamic body;
  String? message;

  ApiResponse({
    required this.isSuccess,
    this.body,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
      isSuccess: data['success'],
      body: data['data'],
      message: data['message'] ?? "Invalid Response",
    );
  }
}
