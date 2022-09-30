// ignore_for_file: unused_import

import 'dart:convert';

import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/hotels/data/models/GetBookingModel.dart';
import 'package:booking_app/features/hotels/data/models/booking_model.dart';
import 'package:booking_app/features/hotels/data/models/facility_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/HotelsModel.dart';

abstract class HotelsLocalDatasource {
  Future<Unit> cacheHotels({required List<HotelModel> hotels});

  Future<List<HotelModel>> getCachedHotels();

  Future<Unit> cacheBookings({required List<BookingModel> bookings});

  Future<GetBookingModel> getCachedBookings();

  Future<Unit> cacheFacilities({required List<HotelFacilities> facilities});

  Future<List<HotelFacilities>> getCachedFacilities();
}

class HotelsLocalDatasourceImpl implements HotelsLocalDatasource {
  const HotelsLocalDatasourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<Unit> cacheBookings({required List<BookingModel> bookings}) {
    List modelsToJson =
        bookings.map<Map<String, dynamic>>((e) => e.toJson()).toList();
    sharedPreferences.setString(CACHED_BOOKINGS, json.encode(modelsToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheFacilities({required List<HotelFacilities> facilities}) {
    List modelsToJson =
        facilities.map<Map<String, dynamic>>((e) => e.toJson()).toList();
    sharedPreferences.setString(CACHED_FACILITIES, json.encode(modelsToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheHotels({required List<HotelModel> hotels}) {
    List modelsToJson =
        hotels.map<Map<String, dynamic>>((e) => e.toJson()).toList();
    sharedPreferences.setString(CACHED_HOTELS, json.encode(modelsToJson));
    return Future.value(unit);
  }

  @override
  Future<GetBookingModel> getCachedBookings() {
    final jsonString = sharedPreferences.getString(CACHED_BOOKINGS);
    if (jsonString != null) {
      var jsonToModels = json.decode(jsonString);
      // List<BookingModel> jsonToModels = decodedJson
      //     .map<BookingModel>((e) => BookingModel.fromJson(e))
      //     .toList();
      return Future.value(jsonToModels);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<HotelFacilities>> getCachedFacilities() {
    final jsonString = sharedPreferences.getString(CACHED_BOOKINGS);
    if (jsonString != null) {
      List decodedJson = json.decode(jsonString);
      List<HotelFacilities> jsonToModels = decodedJson
          .map<HotelFacilities>((e) => HotelFacilities.fromJson(e))
          .toList();
      return Future.value(jsonToModels);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<HotelModel>> getCachedHotels() {
    final jsonString = sharedPreferences.getString(CACHED_BOOKINGS);
    if (jsonString != null) {
      List decodedJson = json.decode(jsonString);
      List<HotelModel> jsonToModels = decodedJson
          .map<HotelModel>((e) => HotelModel.fromJson(e))
          .toList();
      return Future.value(jsonToModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
