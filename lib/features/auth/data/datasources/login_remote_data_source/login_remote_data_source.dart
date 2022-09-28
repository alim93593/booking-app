// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/auth/data/models/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'login_remote_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class LoginDataSource {
  factory LoginDataSource(Dio dio, {String baseUrl}) = _LoginDataSource;
  @POST(LOGIN)
  Future<UserModel> login({
    @Query("email") String? email,
    @Query("password") String? password,

  });
}
