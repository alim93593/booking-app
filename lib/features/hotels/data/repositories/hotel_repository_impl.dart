import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_local_data_source.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:booking_app/features/hotels/domain/entities/booking.dart';
import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class HotelsRepositoryImpl extends HotelsRepository {
  HotelsRepositoryImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final HotelsRemoteDatasource remoteDatasource;
  final HotelsLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Hotel>>> getHotels(
      {required int count, required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await remoteDatasource.getHotels(page: page, count: count);
        await localDatasource.cacheHotels(hotels: data);
        return Right(data);
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
  Future<Either<Failure, List<Booking>>> getBookings(
      {required String token, required String type}) async {
    if (await networkInfo.isConnected) {
      try {
        final data =
            await remoteDatasource.getBookings(token: token, type: type);
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
  Future<Either<Failure, Unit>> createBooking(
      {required String token, required int hotelId}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.createBooking(token: token, hotelId: hotelId);
        return const Right(unit);
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
  Future<Either<Failure, List<Hotel>>> searchHotels({required String name}) {
    // TODO: implement searchHotels
    throw UnimplementedError();
  }
}
