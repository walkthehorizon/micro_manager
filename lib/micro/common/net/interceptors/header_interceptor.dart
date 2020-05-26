import 'package:dio/dio.dart';

/// header拦截器
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    return options;
  }
}
