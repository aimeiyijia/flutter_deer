import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';
import 'package:manager_app/login/widgets/my_text_field.dart';
import 'package:manager_app/res/constant.dart';
import 'package:manager_app/res/resources.dart';
import 'package:manager_app/routers/fluro_navigator.dart';
import 'package:manager_app/store/store_router.dart';
import 'package:manager_app/util/change_notifier_manage.dart';
import 'package:manager_app/util/other_utils.dart';
import 'package:manager_app/util/image_utils.dart';
import 'package:manager_app/widgets/load_image.dart';
import 'package:manager_app/widgets/my_app_bar.dart';
import 'package:manager_app/widgets/my_button.dart';
import 'package:manager_app/widgets/my_scroll_view.dart';
import 'package:sp_util/sp_util.dart';

import '../login_router.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ChangeNotifierMixin<LoginPage> {
  //定义一个controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _passwordController: callbacks,
      _nodeText1: null,
      _nodeText2: null,
    };
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
    _nameController.text = SpUtil.getString(Constant.phone).nullSafe;
  }

  void _verify() {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 6) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    /// 状态不一样再刷新，避免不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    SpUtil.putString(Constant.phone, _nameController.text);
    NavigatorUtils.push(context, StoreRouter.auditPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: ImageUtils.getAssetImage('login/login_form_bg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(left: 12, top: 120, child: Text('12312331323121')),
          Positioned(
            top: 230,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(24.00),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.00),
                  child: Column(
                    children: [
                      ..._buildForms
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _buildForms => <Widget>[
        MyTextField(
          key: const Key('phone'),
          focusNode: _nodeText1,
          controller: _nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: DeerLocalizations.of(context)!.inputUsernameHint,
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('password'),
          keyName: 'password',
          focusNode: _nodeText2,
          isInputPwd: true,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          hintText: DeerLocalizations.of(context)!.inputPasswordHint,
        ),
        Gaps.vGap24,
        MyButton(
          key: const Key('login'),
          onPressed: _clickable ? _login : null,
          text: DeerLocalizations.of(context)!.login,
        ),
        Container(
          height: 40.0,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              DeerLocalizations.of(context)!.forgotPasswordLink,
              key: const Key('forgotPassword'),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            onTap: () =>
                NavigatorUtils.push(context, LoginRouter.resetPasswordPage),
          ),
        ),
        Gaps.vGap16,
        Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                DeerLocalizations.of(context)!.noAccountRegisterLink,
                key: const Key('noAccountRegister'),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () =>
                  NavigatorUtils.push(context, LoginRouter.registerPage),
            ))
      ];
}
