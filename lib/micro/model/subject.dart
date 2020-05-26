import 'package:micro_flutter/generated/json/base/json_convert_content.dart';
import 'package:micro_flutter/generated/json/base/json_filed.dart';

class Subject with JsonConvert<Subject>{
  int id = 0;
  var name;
  var cover;
  var description;
  var tag;
  var created;
  var bgColor = 0;
  @JSONField(name: "cover_1")
  String cover1;
  @JSONField(name: "cover_2")
  String cover2;
}