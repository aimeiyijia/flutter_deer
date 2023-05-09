import 'package:manager_app/generated/json/base/json_convert_content.dart';
import 'package:manager_app/shop/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
	if (avatarUrl != null) {
		userEntity.avatarUrl = avatarUrl;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		userEntity.userName = userName;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? blog = jsonConvert.convert<String>(json['blog']);
	if (blog != null) {
		userEntity.blog = blog;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['avatar_url'] = entity.avatarUrl;
	data['userName'] = entity.userName;
	data['id'] = entity.id;
	data['blog'] = entity.blog;
	return data;
}