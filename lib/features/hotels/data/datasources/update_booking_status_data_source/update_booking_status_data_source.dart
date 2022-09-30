// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/features/hotels/data/models/CreateBookingModel.dart';
import 'package:dio/dio.dart'  hide Headers;
import 'package:retrofit/http.dart';

import '../../../../../core/network/end_points.dart';
import '../../models/UpdateBookingStatus.dart';


part 'update_booking_status_data_source.g.dart';

@RestApi(baseUrl: '$BASE_URL$VERSION')
abstract class UpdateBookingDataSource {
  factory UpdateBookingDataSource(Dio dio, {String baseUrl}) = _UpdateBookingDataSource;
  @POST(UPDATE_BOOKING)
  Future<UpdateBookingStatus> updateBooking({
    @Header("Content-Type") String? contentType,
    @Query("booking_id") num? bookingId,
    @Query("type") String? type,
  });

}