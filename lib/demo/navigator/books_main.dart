import 'package:flutter/material.dart';
import 'package:manager_app/demo/navigator/delegate/router_delegate.dart';
import 'package:manager_app/demo/navigator/parser/route_information_parser.dart';

/// https://gist.github.com/johnpryan/bbca91e23bbb4d39247fa922533be7c9
/// https://weilu.blog.csdn.net/article/details/108902282
class NestedRouterDemo extends StatefulWidget {
  const NestedRouterDemo({super.key});

  @override
  _NestedRouterDemoState createState() => _NestedRouterDemoState();
}

class _NestedRouterDemoState extends State<NestedRouterDemo> {
  final BookRouterDelegate _routerDelegate = BookRouterDelegate();
  final BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
