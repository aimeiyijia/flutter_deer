import 'package:flutter/material.dart';
import 'package:manager_app/login/login_router.dart';
import 'package:manager_app/res/styles.dart';
import 'package:manager_app/routers/fluro_navigator.dart';
import 'package:manager_app/widgets/base_dialog.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({
    super.key,
  });

  @override
  _ExitDialog createState() => _ExitDialog();
}

class _ExitDialog extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text('您确定要退出登录吗？', style: TextStyles.textSize16),
      ),
      onPressed: () {
        NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}
