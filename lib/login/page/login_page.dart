import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';
import 'package:manager_app/login/presenter/login_presenter.dart';
import 'package:manager_app/login/widgets/bubble_tab_indicator.dart';
import 'package:manager_app/login/widgets/my_text_field.dart';
import 'package:manager_app/mvp/base_page.dart';
import 'package:manager_app/mvp/power_presenter.dart';
import 'package:manager_app/res/constant.dart';
import 'package:manager_app/res/resources.dart';
import 'package:manager_app/routers/fluro_navigator.dart';
import 'package:manager_app/util/change_notifier_manage.dart';
import 'package:manager_app/util/image_utils.dart';
import 'package:manager_app/widgets/my_button.dart';

import '../login_router.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with
        BasePageMixin<LoginPage, PowerPresenter<dynamic>>,
        ChangeNotifierMixin<LoginPage>,
        SingleTickerProviderStateMixin {
  // 登录类型切换
  late TabController _tabController;

  final _loginTypes = [
    'acc',
    'cer',
    'num',
  ];

  // 登录类型
  String _loginType = 'acc';
  final Map<String, String> _loginUserNamePlaceholderMatch = <String, String>{
    'acc': '请输入登录账号',
    'num': '请输入手机号码',
    'cer': '请输入证件号码'
  };

  //定义一个controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  bool _remember = false;

  late LoginPresenter _loginPresenter;

  @override
  PowerPresenter<dynamic> createPresenter() {
    final PowerPresenter<dynamic> powerPresenter =
        PowerPresenter<dynamic>(this);
    _loginPresenter = LoginPresenter();
    powerPresenter.requestPresenter([_loginPresenter]);
    return powerPresenter;
  }

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
    _tabController = TabController(vsync: this, length: 3);

    _nameController.text = 'gxy';
    _passwordController.text = 'Pcgl1234';
  }

  void _verify() {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty) {
      clickable = false;
    }
    if (password.isEmpty) {
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
    _loginPresenter.login(
        _loginType, _nameController.text, _passwordController.text);
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
          Positioned(
            top: 120,
            left: 0,
            // width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF1893ff),
                  Color(0xE99fd),
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 90, 12),
                child: Column(
                  children: const [
                    Text(
                      '欢迎登录',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Gaps.vGap4,
                    Text(
                      '破产平台',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFfcff1c),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 230,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(24.00),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe2e2e2),
                      blurRadius: 20.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.00),
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Colors.blueAccent,
                        indicator: const BubbleTabIndicator(),
                        controller: _tabController,
                        tabs: const [
                          Tab(text: '账号'),
                          Tab(text: '证件号码'),
                          Tab(text: '手机号码'),
                        ],
                        onTap: (e) => {
                          setState(() {
                            _loginType = _loginTypes[e];
                          })
                        },
                      ),
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
          hintText: _loginUserNamePlaceholderMatch[_loginType]!,
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
            height: 36.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: SizedBox(
                        height: 14.0,
                        width: 14.0,
                        child: Checkbox(
                          value: _remember,
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                          activeColor: Theme.of(context).primaryColor,
                          //选中时的颜色
                          shape: CircleBorder(),
                          onChanged: (value) {
                            setState(() {
                              _remember = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      '记住密码',
                      key: Key('remeber'),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                GestureDetector(
                  child: Text(
                    DeerLocalizations.of(context)!.forgotPasswordLink,
                    key: const Key('forgotPassword'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onTap: () => NavigatorUtils.push(
                      context, LoginRouter.resetPasswordPage),
                ),
              ],
            )),
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
