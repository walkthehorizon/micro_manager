import 'package:micro_flutter/generated/json/base/json_convert_content.dart';
import 'package:micro_flutter/generated/json/base/json_filed.dart';

class TestEntity with JsonConvert<TestEntity> {
	int id;
	String name;
	String cover;
	@JSONField(name: "cover_1")
	String cover1;
	@JSONField(name: "cover_2")
	String cover2;
	String tag;
	String created;
}
