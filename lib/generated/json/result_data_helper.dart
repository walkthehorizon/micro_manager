import 'package:micro_flutter/micro/common/net/result_data.dart';

resultDataFromJson(ResultData data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = json['data'];
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message'];
	}
	return data;
}

Map<String, dynamic> resultDataToJson(ResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] = entity.data;
	data['code'] = entity.code;
	data['message'] = entity.message;
	return data;
}