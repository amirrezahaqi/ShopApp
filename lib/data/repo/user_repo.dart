import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:shopnew/data/model/order.dart';
import 'package:shopnew/data/src/user_data_src.dart';

import '../model/userinfo.dart';

abstract class IUserRepo {
  Future<UserInfo> getUserInfo();
  Future<Address> getUserAddresses();
  Future<Order> userRecievedOrder();
  Future<Order> userCanselledOrder();
  Future<Order> userProccessingOrder();
}

class UserRepository implements IUserRepo {
  final IUserDataSrc _iUserDataSrc;

  UserRepository(this._iUserDataSrc);
  @override
  @override
  Future<Address> getUserAddresses() => _iUserDataSrc.getUserAddresses();

  @override
  Future<UserInfo> getUserInfo() => _iUserDataSrc.getUserInfo();

  @override
  Future<Order> userCanselledOrder() => _iUserDataSrc.userCanselledOrder();

  @override
  Future<Order> userProccessingOrder() => _iUserDataSrc.userProccessingOrder();

  @override
  Future<Order> userRecievedOrder() => _iUserDataSrc.userRecievedOrder();
}
