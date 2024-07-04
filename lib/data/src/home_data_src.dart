import 'package:dio/dio.dart';
import 'package:shopnew/data/constants.dart';
import 'package:shopnew/data/model/home.dart';
import 'package:shopnew/utils/responce_validator.dart';

abstract class IHomeDataSrc {
  Future<Home> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {
  final Dio httpClient;

  HomeRemoteDataSrc(this.httpClient);

  @override
  Future<Home> getHome() async {
    final Home home;

    final response = await httpClient.get(Endpoints.home);

    HTTpResponceValidator.isValidStatusCode(response.statusCode ?? 0);
    home = Home.fromJson(response.data['data']);
    return home;
  }
}
