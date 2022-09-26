// ignore_for_file: prefer_const_constructors, unused_import

import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/screen/user_profile_screen.dart';
import 'package:booking_app/features/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_hotels.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/bookings_screens/screen/bookings_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/profile_screen/profile_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/settings_screen/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants/strings.dart';
import '../../domain/entities/hotel.dart';
import '../../domain/repositories/hotels_repository.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.getHotelsUseCase) : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.earthAfrica,
      ),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.addressBook,
      ),
      label: 'Bookings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.user,
      ),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.gears,
      ),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    HomeScreen(),
     BookingsScreen(),
    UserProfileScreen(),
     SettingsScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavStates());
  }

  // HotelsRepository hotelsRepository =HotelsRepositoryImpl(networkInfo: NetworkInfo(sl()), localDatasource: LocalDatasourceImpl( sharedPreferences: sl()), remoteDatasource: null)

//  getMethod
  List<Hotel>? hotels;
  GetHotelsUseCase getHotelsUseCase;
  dynamic getHotels() async {
    emit(LoadingState());
    final result = await getHotelsUseCase.call(page: 1, count: 10);
    result.fold((failure) => emit(FailureState(_mapFailureToMessage(failure))),
        (result) {
      hotels = result;
      if (kDebugMode) {
        print(hotels?.length);
      }
      emit(SuccessState(result));
    });
    // if (kDebugMode) {
    //   print(result);
    // }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
