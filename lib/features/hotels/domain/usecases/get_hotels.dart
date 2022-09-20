import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class GetHotelsUseCase {
  const GetHotelsUseCase({required this.hotelsRepository});
  final HotelsRepository hotelsRepository;
  Future<Either<Failure, List<Hotel>>> call()async{
    return await hotelsRepository.getHotels();
  }
}