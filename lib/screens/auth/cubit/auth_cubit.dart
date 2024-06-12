import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopnew/data/src/constants.dart';
import 'package:shopnew/utils/shared_prefrences_keys.dart';
import 'package:shopnew/utils/shared_prefrences_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    emit(LoggedOutState());
  }

  final Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio.post(Endpoints.sendSms, data: {
        "mobile": mobile,
      }).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(Endpoints.checkSmsCode,
          data: {"mobile": mobile, "code": code}).then(
        (value) {
          debugPrint(value.toString());
          if (value.statusCode == 201) {
            SharedPrefrencesManager().saveString(SharedPrefrencesKeys.token,
                value.data["data"][SharedPrefrencesKeys.token]);

            var tokenKeys =
                SharedPrefrencesManager().getString(SharedPrefrencesKeys.token);
            print("token : $tokenKeys");
            if (value.data["data"]["is_registered"]) {
              emit(VerifiedIsRegisteredState());
            } else {
              emit(VerifiedIsNotRegisteredState());
            }
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
