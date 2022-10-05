// ignore_for_file: prefer_const_constructors, unused_import

import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/screen/user_profile_screen.dart';
import 'package:booking_app/features/hotels/data/datasources/search_hotel_data_source/search_hotel_remote_data_source.dart';
import 'package:booking_app/features/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_bookings.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_hotels.dart';
import 'package:booking_app/features/hotels/domain/usecases/search_hotels.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/profile_screen/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/constants/strings.dart';
import '../../data/models/GetBookingModel.dart';
import '../../domain/entities/create_booking_entity.dart';
import '../../domain/entities/get_booking_entity.dart';
import '../../domain/entities/hotel.dart';
import '../../domain/entities/update_booking_status.dart';
import '../../domain/repositories/hotels_repository.dart';
import '../../domain/usecases/create_booking.dart';
import '../../domain/usecases/update_booking_status.dart';
import '../screens/bookings_screens/screen/bookings_screen.dart';
import '../screens/settings_screen/settings_screen.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.getHotelsUseCase,this.updateBookingUseCase, this.searchHotelsUseCase,this.createBookingUseCase,this.getBookingsUseCase)
      : super(AppInitialStates());
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
    // const BottomNavigationBarItem(
    //   icon: Icon(
    //     FontAwesomeIcons.gears,
    //   ),
    //   label: 'Settings',
    // ),
  ];
  List<Widget> screens = [
    HomeScreen(),
    BookingsScreen(),
    UserProfileScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavStates());
  }


//  getMethod
  List<HotelEntity>? hotels;
  List<HotelEntity>? searchHotels;
  int lastPage = 1;
  int total = 0;
  int currentPage = 1;

  GetHotelsUseCase getHotelsUseCase;
  SearchHotelsUseCase searchHotelsUseCase;
  CreateBookingUseCase createBookingUseCase;
  CreateBookingEntity? createBookingEntity;

  UpdateBookingEntity? updateBookingEntity;
  UpdateBookingUseCase updateBookingUseCase;
  GetBookingEntity? getBookingEntity;
  GetBookingsUseCase getBookingsUseCase;
  dynamic getHotels({
    bool isForce = false,
  }) async {
    emit(LoadingState());
    if(isForce) {
      hotels = [];
      currentPage = 1;
    }
    final result = await getHotelsUseCase.call(page: currentPage, count: 10);
    result.fold((failure) => emit(FailureState(_mapFailureToMessage(failure))),
        (result) {
      hotels = result;
      print(hotels![0].latitude.toString());
      if (kDebugMode) {
        print(hotels![0].hotelImages);
      }
      emit(SuccessState(result));
    });
    // if (kDebugMode) {
    //   print(result);
    // }
  }

  dynamic getSearch({required String name}) async {
    emit(SearchLoadingState());
    final result =
        await searchHotelsUseCase.call(page: 1, count: 20, name: name);
    result.fold(
        (failure) => emit(SearchFailureState(_mapFailureToMessage(failure))),
        (result) {
      searchHotels = result;
      if (kDebugMode) {
        print(hotels);
      }
      emit(SearchSuccessState(result));
    });
    // if (kDebugMode) {
    //   print(result);
    // }
  }

  dynamic updateCancelledBooking(
      {required String type,  required num? bookingId,
        required String token,   num count=10,
      }) async {
    emit(UpdateCancelledBookingLoadingState());
    final failureOrData = await updateBookingUseCase(type: type,bookingId: bookingId!,);
    failureOrData.fold((l) {
      emit(UpdateCancelledBookingErrorState());
    }, (r) {
      updateBookingEntity = r;
      getUpcomingBooking(token:CacheHelper.getData(key: 'token') ,type:'upcomming' ,count: 10);
      getCompletedBooking(token:CacheHelper.getData(key: 'token') ,type:'completed' ,count: 10);
      getCancelledBooking(token:CacheHelper.getData(key: 'token') ,type:'cancelled' ,count: 10);

      print('isDAta');
      emit(UpdateCancelledBookingSuccessState(
      ));
    });
  }
  dynamic updateCompletedBooking(
      {required String type,  required num? bookingId,
        required String token,   num count=10,
      }) async {
    emit(UpdateCompletedBookingLoadingState());
    final failureOrData = await updateBookingUseCase(type: type,bookingId: bookingId!,);
    failureOrData.fold((l) {
      emit(UpdateCompletedBookingErrorState());
    }, (r) {
      updateBookingEntity = r;
      getUpcomingBooking(token:CacheHelper.getData(key: 'token') ,type:'upcomming' ,count: 10);
      getCompletedBooking(token:CacheHelper.getData(key: 'token') ,type:'completed' ,count: 10);
      getCancelledBooking(token:CacheHelper.getData(key: 'token') ,type:'cancelled' ,count: 10);
      print('isDAta');
      emit(UpdateCompletedBookingSuccessState(
      ));
    });
  }

  dynamic createBooking(
      {required String token,  required int userId,
        required int hotelId,
       }) async {
    emit(CreateBookingLoadingState());
    final failureOrData = await createBookingUseCase(
     userId:userId ,token: token,hotelId:hotelId ,);
    failureOrData.fold((l) {
      emit(CreateBookingErrorState(error: mapFailureToString(l)));
    }, (r) {
       createBookingEntity = r;
      print('isDAta');
      emit(CreateBookingSuccessState(
        createBookingEntity: createBookingEntity!
      ));
    });
  }

  List<BookingData> completed = [];
  List<BookingData> upcomming  = [];
  List<BookingData> cancelled  = [];



  dynamic getCompletedBooking(
      {required String token,  required num count,
        required String type,
      }) async {
    emit(GetCompletedBookingLoadingState());
    final failureOrData = await getBookingsUseCase(
      count:10 ,token: token,type:type ,);
    failureOrData.fold((l) {
      emit(GetCompletedBookingErrorState());
    }, (r) {
      getBookingEntity = r;
      completed = getBookingEntity!.data!.data!;
      print('isDAta');
      emit(GetCompletedBookingSuccessState(

      ));
    });
  }
  dynamic getCancelledBooking(
      {required String token,  required num count,
        required String type,
      }) async {
    emit(GetCancelledBookingLoadingState());
    final failureOrData = await getBookingsUseCase(
      count:count ,token: token,type:type ,);
    failureOrData.fold((l) {
      emit(GetCancelledBookingErrorState());
    }, (r) {
      getBookingEntity = r;
      cancelled = getBookingEntity!.data!.data!;

      print('isDAta');
      emit(GetCancelledBookingSuccessState(

      ));
    });
  }
  dynamic getUpcomingBooking(
      {required String token,  required num count,
        required String type,
      }) async {
    emit(GetUpcomingBookingLoadingState());
    final failureOrData = await getBookingsUseCase(count:10 ,token: token,type:type ,);
    failureOrData.fold((l) {
      emit(GetUpcomingBookingErrorState());
    }, (r) {
      getBookingEntity = r;
      upcomming = getBookingEntity!.data!.data!;

      print('isDAta');
      emit(GetUpcomingBookingSuccessState(

      ));
    });
  }





  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
  bool isEnd = false;

  void toggleIsEnd() {
    isEnd = !isEnd;

    emit(ToggleIsEndState());
  }

}
