// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/features/hotels/data/models/CreateBookingModel.dart';
import 'package:booking_app/features/hotels/data/models/GetBookingModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/end_points.dart';


part 'get_booking_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class GetBookingDataSource {
  factory GetBookingDataSource(Dio dio, {String baseUrl}) = _GetBookingDataSource;
  @GET(GET_BOOKINGS)
  Future<GetBookingModel> getBooking({
    @Query("type") String? type,
    @Query("count") num? count,
    @Header("token") String? token,
  });
}