import 'package:manager_app/main.dart' as app;
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/home/splash_page.dart
void main() {
  enableFlutterDriverExtension();
  app.main();
}
