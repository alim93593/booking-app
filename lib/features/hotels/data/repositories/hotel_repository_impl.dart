// ignore_for_file: unused_import

import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/hotels/data/datasources/get_booking_data_source/get_booking_data_source.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_local_data_source.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:booking_app/features/hotels/data/datasources/search_hotel_data_source/search_hotel_remote_data_source.dart';
import 'package:booking_app/features/hotels/domain/entities/booking.dart';
import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:booking_app/features/hotels/domain/usecases/search_hotels.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/create_booking_entity.dart';
import '../../domain/entities/get_booking_entity.dart';
import '../datasources/create_booking_data_source/create_booking_data_source.dart';
import '../datasources/get_hotel_remote_data_source.dart';
import '../models/HotelsModel.dart';

class HotelsRepositoryImpl extends HotelsRepository {
  HotelsRepositoryImpl(  {
    required this.getBookingDataSource,
    required this.createBookingDataSource,
    required this.searchHotelService,
     required this.getHotelService,
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final HotelsRemoteDatasource remoteDatasource;
  final HotelsLocalDatasource localDatasource;
  final NetworkInfo networkInfo;
  final GetHotelService getHotelService;
  final SearchHotelService searchHotelService;
  final CreateBookingDataSource createBookingDataSource;
  final GetBookingDataSource getBookingDataSource;

  @override
  Future<Either<Failure,List<HotelEntity>>> getHotels(
      {required int count, required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await getHotelService.getHotels(page: page, count: count);
        // await localDatasource.cacheHotels(hotels: data);
        return Right(data.data!.hotels!);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      try {
        final data = await localDatasource.getCachedHotels();
        return Right(data);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, GetBookingEntity>> getBookings(
      {required String token, required String type, required num count}) async {
    if (await networkInfo.isConnected) {
      try {
        final data =
            await getBookingDataSource.getBooking(token: token, type: type,count:count );
        return Right(data);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      try {
        final data = await localDatasource.getCachedBookings();
        return Right(data);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Facility>>> getFacilities() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await remoteDatasource.getFacilities();
        return Right(data);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      try {
        final data = await localDatasource.getCachedFacilities();
        return Right(data);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CreateBookingEntity>> createBooking(
      {required String token, required int hotelId,required int userId}) async {
    if (await networkInfo.isConnected) {
      try {
       final  data =await createBookingDataSource.getCreateBooking(token: token, hotelId: hotelId,userId: userId);
        return  Right(data);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBookingStatus(
      {required String status, required int? bookingId}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.updateBookingStatus(
            status: status, bookingId: bookingId);
        return const Right(unit);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<HotelEntity>>> searchHotels({required String name,required int count, required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await searchHotelService.getHotels(page: page, count: count,name: name);
        // await localDatasource.cacheHotels(hotels: data);
        return Right(data.data!.data!);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      try {
        final data = await localDatasource.getCachedHotels();
        return Right(data);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }


}
