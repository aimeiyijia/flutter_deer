import 'package:flutter/material.dart';
import 'package:manager_app/login/login_router.dart';
import 'package:manager_app/routers/fluro_navigator.dart';
import 'package:manager_app/widgets/click_item.dart';
import 'package:manager_app/widgets/load_image.dart';
import 'package:manager_app/widgets/my_app_bar.dart';

/// design/8设置/index.html#artboard1
class AccountManagerPage extends StatefulWidget {
  const AccountManagerPage({super.key});

  @override
  _AccountManagerPageState createState() => _AccountManagerPageState();
}

class _AccountManagerPageState extends State<AccountManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '账号管理',
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClickItem(title: '店铺logo', onTap: () {}),
              const Positioned(
                top: 8.0,
                bottom: 8.0,
                right: 40.0,
                child: LoadAssetImage('shop/tx', width: 34.0),
              )
            ],
          ),
          ClickItem(
              title: '修改密码',
              content: '用于密码登录',
              onTap: () =>
                  NavigatorUtils.push(context, LoginRouter.updatePasswordPage)),
          const ClickItem(
            title: '绑定账号',
            content: '15000000000',
          ),
        ],
      ),
    );
  }
}
