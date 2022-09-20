import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class CreateBookingUseCase {
  const CreateBookingUseCase({required this.hotelsRepository});

  final HotelsRepository hotelsRepository;

  Future<Either<Failure, Unit>> call({
    required String token,
    required int hotelId,
  }) async {
    return await hotelsRepository.createBooking(token: token, hotelId: hotelId);
  }
}
