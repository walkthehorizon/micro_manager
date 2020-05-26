import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';
///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 错误拦截
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData.origin(
          Code.errorHandleFunction(Code.NETWORK_ERROR, ""),
          false,
          Code.NETWORK_ERROR));
    }
    return options;
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return  _dio.reject(new ResultData.origin(
        Code.errorHandleFunction(Code.NETWORK_ERROR, err.message),
        false,
        err.response.statusCode));
  }
}
