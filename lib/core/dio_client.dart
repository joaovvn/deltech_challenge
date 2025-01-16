import 'package:deltech_challenge/constants/urls.dart';
import 'package:dio/dio.dart';

class DioClient {
  Dio dio;

  DioClient() : dio = Dio() {
    dio.options.baseUrl = AppUrls.baseUrl;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
  }
  Future<Response> get(String url) async {
    if (url.contains(dio.options.baseUrl)) {
      url.replaceAll(dio.options.baseUrl, '');
    }
    try {
      return await dio.get(url);
    } catch (e) {
      rethrow;
    }
  }
}
