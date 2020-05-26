import 'package:bot_toast/bot_toast.dart';

///错误编码
class Code {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message) {
    BotToast.showText(text: "$code,$message"); //弹出简单通知Toast
//    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }
}
