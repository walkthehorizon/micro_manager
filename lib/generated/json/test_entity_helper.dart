import 'package:micro_flutter/micro/model/test_entity.dart';

testEntityFromJson(TestEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['cover_1'] != null) {
		data.cover1 = json['cover_1']?.toString();
	}
	if (json['cover_2'] != null) {
		data.cover2 = json['cover_2']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['created'] != null) {
		data.created = json['created']?.toString();
	}
	return data;
}

Map<String, dynamic> testEntityToJson(TestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['cover'] = entity.cover;
	data['cover_1'] = entity.cover1;
	data['cover_2'] = entity.cover2;
	data['tag'] = entity.tag;
	data['created'] = entity.created;
	return data;
}