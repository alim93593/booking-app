import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class GetFacilitiesUseCase {
  const GetFacilitiesUseCase({required this.hotelsRepository});
  final HotelsRepository hotelsRepository;

  Future<Either<Failure , List<Facility>>> call()async{
    return await hotelsRepository.getFacilities();
  }

}