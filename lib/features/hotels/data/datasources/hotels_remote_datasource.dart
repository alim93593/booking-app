import 'package:booking_app/features/hotels/data/models/booking_model.dart';
import 'package:booking_app/features/hotels/data/models/facility_model.dart';
import 'package:booking_app/features/hotels/data/models/hotel_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class HotelsRemoteDatasource {
  Future<List<HotelModel>> getHotels();

  Future<List<HotelModel>> searchHotels({
    required String name,
  });

  Future<Unit> createBooking({
    required String token,
    required int hotelId,
  });

  Future<Unit> updateBookingStatus({
    required String token,
    required String status,
    required int? bookingId,
  });

  Future<List<BookingModel>> getBookings({
    required String token,
    required String type,
  });

  Future<List<FacilityModel>> getFacilities();
}

class HotelsRemoteDatasourceImpl implements HotelsRemoteDatasource {
  const HotelsRemoteDatasourceImpl({required this.client});

  final http.Client client;

  @override
  Future<Unit> createBooking(
      {required String token, required int hotelId}) async {
    // TODO: implement createBooking
    throw UnimplementedError();
  }

  @override
  Future<List<BookingModel>> getBookings(
      {required String token, required String type}) async {
    // TODO: implement getBookings
    throw UnimplementedError();
  }

  @override
  Future<List<FacilityModel>> getFacilities() async {
    // TODO: implement getFacilities
    throw UnimplementedError();
  }

  @override
  Future<List<HotelModel>> getHotels() async {
    // TODO: implement getHotels
    throw UnimplementedError();
  }

  @override
  Future<List<HotelModel>> searchHotels({required String name}) async {
    // TODO: implement searchHotels
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateBookingStatus(
      {required String token,
      required String status,
      required int? bookingId}) async {
    // TODO: implement updateBookingStatus
    throw UnimplementedError();
  }
}
