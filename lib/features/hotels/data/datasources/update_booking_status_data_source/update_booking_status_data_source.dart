// // ignore_for_file: depend_on_referenced_packages
//
// import 'package:booking_app/features/hotels/data/models/CreateBookingModel.dart';
// import 'package:dio/dio.dart'  hide Headers;
// import 'package:retrofit/http.dart';
//
// import '../../../../../core/network/end_points.dart';
// import '../../models/UpdateBookingStatus.dart';
//
//
// part 'update_booking_status_data_source.g.dart';
//
// @RestApi(baseUrl: '$BASE_URL$VERSION')
// abstract class UpdateBookingDataSource {
//   factory UpdateBookingDataSource(Dio dio, {String baseUrl}) = _UpdateBookingDataSource;
//   @POST(UPDATE_BOOKING)
//   @MultiPart()
//   Future<UpdateBookingStatus> updateBooking({
//     @Part(name:"booking_id") num? bookingId,
//     @Part(name:"type") String? type
//   });
//
// }


import 'dart:convert';

import '../../models/UpdateBookingStatus.dart';
import 'package:http/http.dart' as http;

class UpdateBookingDataSource{
  Future<UpdateBookingStatus> updateBooking({num? bookingId,String? type})async{
    var request = http.MultipartRequest('POST', Uri.parse('http://api.mahmoudtaha.com/api/update-booking-status'));
    request.fields.addAll({
      'booking_id': '$bookingId',
      'type': type!
    });


     http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return  UpdateBookingStatus.fromJson(jsonDecode(await response.stream.bytesToString()));
    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to create album.');
    }

  }
}