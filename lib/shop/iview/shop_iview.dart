import 'package:manager_app/mvp/mvps.dart';
import 'package:manager_app/shop/models/user_entity.dart';

abstract class ShopIMvpView implements IMvpView {
  void setUser(UserEntity? user);

  bool get isAccessibilityTest;
}
