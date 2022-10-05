import '../../domain/entities/create_booking_entity.dart';
import '../../domain/entities/hotel.dart';

abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppBottomNavStates extends AppStates {}

class SuccessState extends AppStates {
  final List<HotelEntity>? hotels;
  SuccessState(this.hotels);
}

class LoadingState extends AppStates {}

class FailureState extends AppStates {
  FailureState(this.message);
  final String message;
}

class CreateBookingSuccessState extends AppStates {
  // final  List<Hotel>?  hotels;
  // SuccessState(this.hotels);
  CreateBookingSuccessState({required this.createBookingEntity});
  final CreateBookingEntity createBookingEntity;
}

class CreateBookingLoadingState extends AppStates {
  // final  List<Hotel>?  hotels;
  // SuccessState(this.hotels);

}

class CreateBookingErrorState extends AppStates {
  // final  List<Hotel>?  hotels;
  // SuccessState(this.hotels);
  CreateBookingErrorState({required this.error});
  String error;
}

class SearchSuccessState extends AppStates {
  final List<HotelEntity>? hotels;
  SearchSuccessState(this.hotels);
}

class SearchLoadingState extends AppStates {}

class SearchFailureState extends AppStates {
  SearchFailureState(this.message);
  final String message;
}

class ToggleIsEndState extends AppStates {}


class GetUpcomingBookingLoadingState extends AppStates {}
class GetUpcomingBookingSuccessState extends AppStates {}
class GetUpcomingBookingErrorState extends AppStates {}
class GetCompletedBookingLoadingState extends AppStates {}
class GetCompletedBookingSuccessState extends AppStates {}
class GetCompletedBookingErrorState extends AppStates {}
class GetCancelledBookingLoadingState extends AppStates {}
class GetCancelledBookingSuccessState extends AppStates {}
class GetCancelledBookingErrorState extends AppStates {}
class UpdateCancelledBookingLoadingState extends AppStates {}
class UpdateCancelledBookingSuccessState extends AppStates {}
class UpdateCancelledBookingErrorState extends AppStates {}
class UpdateCompletedBookingLoadingState extends AppStates {}
class UpdateCompletedBookingSuccessState extends AppStates {}
class UpdateCompletedBookingErrorState extends AppStates {}
