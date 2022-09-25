// ignore_for_file: depend_on_referenced_packages

import 'package:retrofit/http.dart';

import '../../../../core/network/end_points.dart';

import 'package:dio/dio.dart';

import '../models/HotelsModel.dart';

part 'get_hotel_remote_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class GetHotelService {
  factory GetHotelService(Dio dio, {String baseUrl}) = _GetHotelService;
  @GET(GET_HOTELS)
  Future<HotelsModel> getHotels({
    @Query("count") num? count,
    @Query("page") num? page,
  });
}