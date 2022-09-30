// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/features/hotels/data/models/CreateBookingModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/end_points.dart';


part 'create_booking_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class CreateBookingDataSource {
  factory CreateBookingDataSource(Dio dio, {String baseUrl}) = _CreateBookingDataSource;
  @POST(CREATE_BOOKING)
  Future<CreateBookingModel> getCreateBooking({
    @Header("token") String? token,
    @Query("user_id") num? userId,
    @Query("hotel_id") num? hotelId,
  });
}