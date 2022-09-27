// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:booking_app/features/hotels/data/models/SearchModel.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/end_points.dart';

import 'package:dio/dio.dart';

import '../../models/HotelsModel.dart';

part 'search_hotel_remote_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class SearchHotelService {
  factory SearchHotelService(Dio dio, {String baseUrl}) = _SearchHotelService;
  @GET(SEARCH_HOTELS)
  Future<SearchModel> getHotels({
    @Query("count") num? count,
    @Query("page") num? page,
    @Query("name") String? name,

  });
}