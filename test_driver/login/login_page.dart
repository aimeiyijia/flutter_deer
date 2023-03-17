import 'package:flutter/material.dart';
import 'package:manager_app/login/page/login_page.dart';
import 'package:manager_app/main.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/login/login_page.dart
void main() {
  enableFlutterDriverExtension();
  runApp(MyApp(home: const LoginPage()));
}
