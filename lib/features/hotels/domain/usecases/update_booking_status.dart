import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateBookingUseCase {
  const UpdateBookingUseCase({required this.hotelsRepository});

  final HotelsRepository hotelsRepository;

  Future<Either<Failure, Unit>> call({
    required String token,
    required String status,
    required int bookingId,
  }) async {
    return await hotelsRepository.updateBookingStatus(
      status: status,
      bookingId: bookingId,
    );
  }
}
