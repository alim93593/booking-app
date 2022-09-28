// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/auth/data/models/ProfileModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'get_profile_info_remote_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class GetProfileInfoDataSource {
  factory GetProfileInfoDataSource(Dio dio, {String baseUrl}) = _GetProfileInfoDataSource;
  @GET(PROFILE_INFO)
  Future<ProfileModel> getProfileInfo({
    @Header("token") String? token
  });
}
