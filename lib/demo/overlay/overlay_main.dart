import 'package:flutter/material.dart';
import 'package:manager_app/demo/overlay/page/overlay_demo_page.dart';
import 'package:manager_app/demo/overlay/route/application.dart';
import 'package:manager_app/demo/overlay/route/my_navigator_observer.dart';

class OverlayDemo extends StatelessWidget {
  OverlayDemo({super.key}) {
    Application.navigatorObserver = MyNavigatorObserver();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OverlayDemoPage(),
      navigatorObservers: <NavigatorObserver>[Application.navigatorObserver],
    );
  }
}
