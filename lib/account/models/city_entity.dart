import 'package:azlistview/azlistview.dart';
import 'package:manager_app/generated/json/base/json_field.dart';
import 'package:manager_app/generated/json/city_entity.g.dart';

@JsonSerializable()
class CityEntity with ISuspensionBean {
  CityEntity();

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      $CityEntityFromJson(json);

  Map<String, dynamic> toJson() => $CityEntityToJson(this);

  late String name;
  late String cityCode;
  late String firstCharacter;

  @override
  String getSuspensionTag() {
    return firstCharacter;
  }
}
