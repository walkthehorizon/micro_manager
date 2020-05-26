import 'package:micro_flutter/micro/model/subject.dart';

subjectFromJson(Subject data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['cover'] != null) {
		data.cover = json['cover'];
	}
	if (json['description'] != null) {
		data.description = json['description'];
	}
	if (json['tag'] != null) {
		data.tag = json['tag'];
	}
	if (json['created'] != null) {
		data.created = json['created'];
	}
	if (json['bgColor'] != null) {
		data.bgColor = json['bgColor'];
	}
	if (json['cover_1'] != null) {
		data.cover1 = json['cover_1']?.toString();
	}
	if (json['cover_2'] != null) {
		data.cover2 = json['cover_2']?.toString();
	}
	return data;
}

Map<String, dynamic> subjectToJson(Subject entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['cover'] = entity.cover;
	data['description'] = entity.description;
	data['tag'] = entity.tag;
	data['created'] = entity.created;
	data['bgColor'] = entity.bgColor;
	data['cover_1'] = entity.cover1;
	data['cover_2'] = entity.cover2;
	return data;
}