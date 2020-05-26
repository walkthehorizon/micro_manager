import 'package:micro_flutter/generated/json/base/json_convert_content.dart';
class Wallpaper with JsonConvert<Wallpaper>{
  int id;
  var url;
  var originUrl;
  var subjectId;
  var categoryId;
  var collectNum;
  var shareNum;
  var downloadNum;
  var commentNum;
  var created;
}