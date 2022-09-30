import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/entities/booking.dart';
import 'package:booking_app/features/hotels/domain/entities/get_booking_entity.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class GetBookingsUseCase {
  const GetBookingsUseCase({required this.hotelsRepository});

  final HotelsRepository hotelsRepository;

  Future<Either<Failure, GetBookingEntity>> call({
    required String token,
    required String type,
    required num count,

  }) async {
    return await hotelsRepository.getBookings(token: token, type: type,count:count);
  }
}
