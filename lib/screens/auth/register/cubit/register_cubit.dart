// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:shopnew/data/constants.dart';
import 'package:shopnew/data/model/user.dart';
import 'package:shopnew/utils/shared_prefrences_keys.dart';
import 'package:shopnew/utils/shared_prefrences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  pickTheLocation({required context}) async {
    await showSimplePickerLocation(
            isDismissible: true,
            title: "انتخاب موقعیت مکانی",
            textCancelPicker: "لغو",
            textConfirmPicker: "انتخاب",
            zoomOption: const ZoomOption(initZoom: 8),
            initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
            radius: 8.0,
            context: context)
        .then((value) => emit(LocationPickedState(location: value)));
  }

  register({required User user}) async {
    emit(LoadingState());
    try {
      String? token =
          SharedPrefrencesManager().getString(SharedPrefrencesKeys.token);
      _dio.options.headers['Authorization'] = "Bearer $token";
      await _dio
          .post(Endpoints.register, data: FormData.fromMap(user.toMap()))
          .then(
        (value) {
          if (value.statusCode == 201) {
            emit(OkResponceState());
          } else {
            emit(ErrorState());
          }
        },
      );
    } catch (e) {
      emit(ErrorState());
    }
  }
}
