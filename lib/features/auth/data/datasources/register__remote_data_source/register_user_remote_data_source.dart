// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/auth/data/models/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'register_user_remote_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class RegisterUserDataSource {
  factory RegisterUserDataSource(Dio dio, {String baseUrl}) = _RegisterUserDataSource;
  @POST(REGISTER)
  Future<UserModel> registerUser({
    @Query("email") String? email,
    @Query("name") String? name,
    @Query("password") String? password,
    @Query("password_confirmation") String? password_confirmation,

  });
}
