import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/create_booking_entity.dart';
import '../entities/update_booking_status.dart';

class UpdateBookingUseCase {
  const UpdateBookingUseCase({required this.hotelsRepository});

  final HotelsRepository hotelsRepository;

  Future<Either<Failure, UpdateBookingEntity>> call({
    required String type,
    required num bookingId,
  }) async {
    return await hotelsRepository.updateBookingStatus(
      type: type,
      bookingId: bookingId,

    );
  }
}
