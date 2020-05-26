import 'package:micro_flutter/generated/json/base/json_convert_content.dart';
import 'package:micro_flutter/micro/common/net/api.dart';
import 'package:micro_flutter/micro/model/subject.dart';
import 'package:micro_flutter/micro/model/wallpaper.dart';

class SubjectDao {
  static Future<List<Subject>> getSubjects(int offset) async {
    Map<String, dynamic> data =
        await httpManager.get("subjects", {"limit": "20", "offset": offset});
    return new Future.value(
        JsonConvert.fromJsonAsT<List<Subject>>(data['data']['content']));
  }

  static Future<List<Wallpaper>> getSubjectWallpapers(int subjectId) async {
    Map<String, dynamic> data =
        await httpManager.get("wallpapers", {"limit": "100", "subject_id": subjectId});
    return new Future.value(
        JsonConvert.fromJsonAsT<List<Wallpaper>>(data['data']['content']));
  }

//  static getSubjects(int offset) async {
//    return await Future.value(
//        httpManager.get("subjects", {"limit": "20", "offset": offset}));
//  }
}
