import 'package:dio/dio.dart';
import 'package:shopnew/data/model/home.dart';
import 'package:shopnew/data/src/home_data_src.dart';

abstract class IHomeRepo {
  Future<Home> getHome();
}

class HomeRepository implements IHomeRepo {
  final IHomeDataSrc _homeDataSrc;

  HomeRepository(this._homeDataSrc);

  @override
  Future<Home> getHome() => _homeDataSrc.getHome();
}

final homeRepository = HomeRepository(HomeRemoteDataSrc(Dio()));
