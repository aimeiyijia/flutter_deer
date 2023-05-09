import 'dart:io';

import 'package:manager_app/login/api/login_api.dart';
import 'package:manager_app/mvp/base_page_presenter.dart';
import 'package:manager_app/net/net.dart';
import 'package:manager_app/routers/fluro_navigator.dart';
import 'package:manager_app/shop/models/user_entity.dart';
import 'package:manager_app/stores/provider/userInfo_provider.dart';
import 'package:manager_app/util/log_utils.dart';
import '../models/test_entity.dart';

import '../../store/store_router.dart';

class LoginPresenter extends BasePagePresenter {
  void login(String loginType, String userName, String password) {
    final UserInfoProvider provider = UserInfoProvider();
    final Map<String, dynamic> params = <String, dynamic>{};
    params['roleCode'] = 'glr';
    params['type'] = loginType;
    params['userName'] = userName;
    params['password'] = password;
    params['loginWay'] = 2;
    params['operatorSystemType'] = Platform.isIOS ? 1 : 0;
    asyncRequestNetwork<TestEntity>(Method.post,
        url: LoginApi.userLogin, params: params, onSuccess: (data) {
      if (data != null) {
        Log.e(data.userName.toString(), tag: 'idcard');
      }

      provider.setUserInfo({
        'idCard': '123',
      });
      Log.e(provider.userInfo.toJson().toString());
      return;
      NavigatorUtils.push(view.getContext(), StoreRouter.auditPage);
    }, onError: (_, __) {});
  }
}
