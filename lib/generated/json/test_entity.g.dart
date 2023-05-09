import 'package:manager_app/generated/json/base/json_convert_content.dart';
import 'package:manager_app/login/models/test_entity.dart';

TestEntity $TestEntityFromJson(Map<String, dynamic> json) {
	final TestEntity testEntity = TestEntity();
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		testEntity.userName = userName;
	}
	return testEntity;
}

Map<String, dynamic> $TestEntityToJson(TestEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userName'] = entity.userName;
	return data;
}