import 'package:dio/dio.dart';
import 'package:micro_flutter/micro/common/net/result_data.dart';

import 'dart:collection';

import 'code.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  var _dio = new Dio(); // 使用默认配置

  HttpManager() {

    // 配置dio实例
    _dio.options.baseUrl = "http://192.168.10.122/micro/";
    _dio.options.connectTimeout = 10000; //5s
    _dio.options.receiveTimeout = 10000;

    _dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志

    _dio.interceptors.add(new HeaderInterceptors());

//    _dio.interceptors.add(new LogsInterceptors());

    _dio.interceptors.add(new ErrorInterceptors(_dio));
  }

  ///通用的GET请求
  get(url, params) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///通用的POST请求
  post(url, params) async {
    Response response;
    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///统一的错误处理
  resultError(DioError e) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
    } else {
      errorResponse = new Response(statusCode: 666);
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = Code.NETWORK_TIMEOUT;
    }
    return new ResultData.origin(
        Code.errorHandleFunction(errorResponse.statusCode, e.message),
        false,
        errorResponse.statusCode);
  }

  ///通用网络请求
  netFetch(
      url, params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }
    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }
    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();
