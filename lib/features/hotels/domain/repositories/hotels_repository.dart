import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/entities/booking.dart';
import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:dartz/dartz.dart';

import '../entities/create_booking_entity.dart';
import '../entities/get_booking_entity.dart';
import '../entities/update_booking_status.dart';

abstract class HotelsRepository {
  Future<Either<Failure,List<HotelEntity>>> getHotels({
  required int count,
    required int  page,
});
  // TODO: implement searchHotels
  Future<Either<Failure, List<HotelEntity>>> searchHotels({
    required String name,
    required int count,
    required int  page,
  });

  Future<Either<Failure, CreateBookingEntity>> createBooking({
    required String token,
    required int hotelId,
    required int userId,

  });

  Future<Either<Failure, UpdateBookingEntity>> updateBookingStatus({
    required String type,
    required num? bookingId,
  });

  Future<Either<Failure, GetBookingEntity>> getBookings({
    required String token,
    required String type,
    required num count,
  });

  Future<Either<Failure, List<Facility>>> getFacilities();
}
