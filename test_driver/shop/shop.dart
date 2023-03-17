import 'package:flutter/material.dart';
import 'package:manager_app/home/home_page.dart';
import 'package:manager_app/main.dart';
import 'package:manager_app/res/constant.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/shop/shop.dart
void main() {
  enableFlutterDriverExtension();
  Constant.isDriverTest = true;
  runApp(MyApp(home: const Home()));
}
