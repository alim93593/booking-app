import '../../domain/entities/hotel.dart';

abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppBottomNavStates extends AppStates {}
class SuccessState extends AppStates {
  final  List<Hotel>?  hotels;
  SuccessState(this.hotels);

}
class LoadingState extends AppStates {}
class FailureState extends AppStates {
   FailureState(this.message);
  final String message;
}

class SearchSuccessState extends AppStates {
  final  List<Hotel>?  hotels;
  SearchSuccessState(this.hotels);

}

class SearchLoadingState extends AppStates {}
class SearchFailureState extends AppStates {
SearchFailureState(this.message);
  final String message;
}
class ToggleIsEndState extends AppStates {}