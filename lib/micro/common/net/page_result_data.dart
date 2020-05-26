import 'package:micro_flutter/generated/json/base/json_convert_content.dart';

class PageResultData with JsonConvert<PageResultData>{
  int count;
  String previous;
  String next;
  var content;
}
