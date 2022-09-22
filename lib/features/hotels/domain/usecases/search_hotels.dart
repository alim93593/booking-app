import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class SearchHotelsUseCase {
  const SearchHotelsUseCase({required this.hotelsRepository});

  final HotelsRepository hotelsRepository;
  // TODO: implement searchHotels
  Future<Either<Failure, List<Hotel>>> call({required String name}) async {
    return await hotelsRepository.searchHotels(name: name);
  }
}
