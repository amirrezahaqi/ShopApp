import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:shopnew/data/model/order.dart';

import '../model/userinfo.dart';

abstract class IUserDataSrc {
  Future<UserInfo> getUserInfo();
  Future<Address> getUserAddresses();
  Future<Order> userRecievedOrder();
  Future<Order> userCanselledOrder();
  Future<Order> userProccessingOrder();
}

class RemoteDataSrc implements IUserDataSrc {
  @override
  Future<Address> getUserAddresses() {
    // TODO: implement getUserAddresses
    throw UnimplementedError();
  }

  @override
  Future<UserInfo> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<Order> userCanselledOrder() {
    // TODO: implement userCanselledOrder
    throw UnimplementedError();
  }

  @override
  Future<Order> userProccessingOrder() {
    // TODO: implement userProccessingOrder
    throw UnimplementedError();
  }

  @override
  Future<Order> userRecievedOrder() {
    // TODO: implement userRecievedOrder
    throw UnimplementedError();
  }
}
