import 'package:manager_app/generated/json/base/json_field.dart';
import 'package:manager_app/generated/json/test_entity.g.dart';

@JsonSerializable()
class TestEntity {

	String? userName;
  
  TestEntity();

  factory TestEntity.fromJson(Map<String, dynamic> json) => $TestEntityFromJson(json);

  Map<String, dynamic> toJson() => $TestEntityToJson(this);
}