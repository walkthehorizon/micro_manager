import 'package:micro_flutter/generated/json/base/json_convert_content.dart';

class ResultData with JsonConvert<ResultData>{
  var data;
  int code;
  var message;

  ResultData();

  ResultData.origin(this.data, this.message, this.code);
}
