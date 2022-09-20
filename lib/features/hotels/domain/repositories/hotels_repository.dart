import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/entities/booking.dart';
import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:dartz/dartz.dart';

abstract class HotelsRepository {
  Future<Either<Failure, List<Hotel>>> getHotels();

  Future<Either<Failure, List<Hotel>>> searchHotels({
    required String name,
  });

  Future<Either<Failure, Unit>> createBooking({
    required String token,
    required int hotelId,
  });

  Future<Either<Failure, Unit>> updateBookingStatus({
    required String token,
    required String status,
    required int? hotelId,
  });

  Future<Either<Failure, List<Booking>>> getBookings({
    required String token,
    required String type,
  });

  Future<Either<Failure, List<Facility>>> getFacilities();
}
