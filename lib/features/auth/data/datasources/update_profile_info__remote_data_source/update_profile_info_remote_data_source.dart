// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/auth/data/models/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'update_profile_info_remote_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class UpdateProfileInfoDataSource {
  factory UpdateProfileInfoDataSource(Dio dio, {String baseUrl}) = _UpdateProfileInfoDataSource;
  @POST(UPDATE_INFO)
  Future<UserModel> updateProfileInfo({
    @Header("token") String? token,
    @Query("email") String? email,
    @Query("image") String? image,
    @Query("name") String? name,


  });
}
