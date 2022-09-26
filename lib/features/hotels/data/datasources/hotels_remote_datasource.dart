// ignore_for_file: unused_import, override_on_non_overriding_member

import 'dart:convert';

import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/hotels/data/models/booking_model.dart';
import 'package:booking_app/features/hotels/data/models/facility_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../models/HotelsModel.dart';

abstract class HotelsRemoteDatasource {
  // Future<HotelsModel> getHotels({required int page, required int count});

  Future<List<HotelModel>> searchHotels({
    required String name,
  });

  Future<Unit> createBooking({
    required String token,
    required int hotelId,
  });

  Future<Unit> updateBookingStatus({
    required String status,
    required int? bookingId,
  });

  Future<List<BookingModel>> getBookings({
    required String token,
    required String type,
  });

  Future<List<HotelFacilities>> getFacilities();
}

class HotelsRemoteDatasourceImpl implements HotelsRemoteDatasource {
  const HotelsRemoteDatasourceImpl({required this.client});

  final http.Client client;

  // @override
  // Future<List<HotelModel>> getHotels(
  //     {required int page, required int count}) async {
  //   final response = await client.get(
  //     Uri.parse(
  //       '$BASE_URL$VERSION$GET_HOTELS?count=$count&page=$page',
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     List<HotelModel> hotelResponse =HotelsModel.fromJson(jsonDecode(response.body)).data.;
  //     return hotelResponse;
  //
  //   }
  //
  //   throw ApiException();
  // }



  // Future<TopRatedResponse> fetchTopRated() async {
  //   // var params = {'apiKey': apiKey};
  //   // print("url1" + baseUrl + popularMovies);
  //   final response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/top_rated?api_key=7099f13be0ff703863e57b10982f58c3'));
  //
  //   var topRatedResponse =
  //   if (response.statusCode == 200) {
  //     return topRatedResponse;
  //   }
  //
  //   throw Exception('error loading movies ');
  // }

  @override
  Future<Unit> createBooking(
      {required String token, required int hotelId}) async {
    final response = await client.post(
      Uri.parse('$BASE_URL$VERSION$CREATE_BOOKING'),
      headers: {
        "token": token,
      },
      body: {
        "hotel_id": hotelId,
      },
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    }

    throw ApiException();
  }

  @override
  Future<Unit> updateBookingStatus({
    required String status,
    required int? bookingId,
  }) async {
    final response = await client.post(
        Uri.parse(
          '$BASE_URL$VERSION$UPDATE_BOOKING',
        ),
        body: {
          "booking_id": bookingId,
          'type': status,
        });
    if (response.statusCode == 200) {
      return Future.value(unit);
    }
    throw ApiException();
  }

  @override
  Future<List<BookingModel>> getBookings(
      {required String token, required String type}) async {
    final response = await client.get(
        Uri.parse(
          '$BASE_URL$VERSION$GET_BOOKINGS?type=$type&count=10',
        ),
        headers: {
          "token": token,
        });
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<BookingModel> bookings = decodedJson
          .map<BookingModel>((e) => BookingModel.fromJson(e))
          .toList();
      return bookings;
    }

    throw ApiException();
  }

  @override
  Future<List<HotelFacilities>> getFacilities() async {
    // final response = await client.get(Uri.parse(
    //   '$BASE_URL$VERSION$GET_FACILITIES',
    // ));
    //
    // if (response.statusCode == 200) {
    //   final List decodedJson = json.decode(response.body) as List;
    //   final List<FacilityModel> facilities = decodedJson
    //       .map<FacilityModel>((e) => FacilityModel.fromJson(e))
    //       .toList();
    //   return facilities;
    // }

    throw ApiException();
  }

  @override
  Future<List<HotelModel>> searchHotels({required String name}) async {
    // TODO: implement searchHotels
    throw UnimplementedError();
  }

  @override
  Future<HotelsModel> getHotels({required int page, required int count}) {
    // TODO: implement getHotels
    throw UnimplementedError();
  }
}
