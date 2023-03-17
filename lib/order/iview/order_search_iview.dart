import 'package:manager_app/mvp/mvps.dart';
import 'package:manager_app/order/models/search_entity.dart';
import 'package:manager_app/order/provider/base_list_provider.dart';

abstract class OrderSearchIMvpView implements IMvpView {
  BaseListProvider<SearchItems> get provider;
}
