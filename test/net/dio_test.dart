import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:manager_app/net/net.dart';
import 'package:manager_app/shop/models/user_entity.dart';
import 'package:test/test.dart';

void main() {
  group('dio_test', () {
    Dio dio;
    setUp(() {
      /// 测试配置
      dio = DioUtils.instance.dio;
      dio.options.baseUrl = 'https://api.github.com/';
    });

    test('getUsers', () async {
      await DioUtils.instance.requestNetwork<UserEntity>(
          Method.get, HttpApi.users, onSuccess: (data) {
        expect(data?.name, '唯鹿');
      }, onError: (_, __) {
        debugPrint('$_, $__');
      });
    });
  });
}
