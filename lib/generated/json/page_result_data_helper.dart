import 'package:micro_flutter/micro/common/net/page_result_data.dart';

pageResultDataFromJson(PageResultData data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['previous'] != null) {
		data.previous = json['previous']?.toString();
	}
	if (json['next'] != null) {
		data.next = json['next']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content'];
	}
	return data;
}

Map<String, dynamic> pageResultDataToJson(PageResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['previous'] = entity.previous;
	data['next'] = entity.next;
	data['content'] = entity.content;
	return data;
}