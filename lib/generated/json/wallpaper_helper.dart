import 'package:micro_flutter/micro/model/wallpaper.dart';

wallpaperFromJson(Wallpaper data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['url'] != null) {
		data.url = json['url'];
	}
	if (json['originUrl'] != null) {
		data.originUrl = json['originUrl'];
	}
	if (json['subjectId'] != null) {
		data.subjectId = json['subjectId'];
	}
	if (json['categoryId'] != null) {
		data.categoryId = json['categoryId'];
	}
	if (json['collectNum'] != null) {
		data.collectNum = json['collectNum'];
	}
	if (json['shareNum'] != null) {
		data.shareNum = json['shareNum'];
	}
	if (json['downloadNum'] != null) {
		data.downloadNum = json['downloadNum'];
	}
	if (json['commentNum'] != null) {
		data.commentNum = json['commentNum'];
	}
	if (json['created'] != null) {
		data.created = json['created'];
	}
	return data;
}

Map<String, dynamic> wallpaperToJson(Wallpaper entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['url'] = entity.url;
	data['originUrl'] = entity.originUrl;
	data['subjectId'] = entity.subjectId;
	data['categoryId'] = entity.categoryId;
	data['collectNum'] = entity.collectNum;
	data['shareNum'] = entity.shareNum;
	data['downloadNum'] = entity.downloadNum;
	data['commentNum'] = entity.commentNum;
	data['created'] = entity.created;
	return data;
}