import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/create_booking_entity.dart';

class CreateBookingUseCase {
  const CreateBookingUseCase({required this.hotelsRepository});

  final HotelsRepository hotelsRepository;

  Future<Either<Failure, CreateBookingEntity>> call({
    required String token,
    required int hotelId,
    required int userId,

  }) async {
    return await hotelsRepository.createBooking(token: token, hotelId: hotelId,userId:userId);
  }
}
