// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/data/datasources/login_remote_data_source/login_remote_data_source.dart';
import 'package:booking_app/features/auth/data/datasources/register__remote_data_source/register_user_remote_data_source.dart';
import 'package:booking_app/features/auth/data/datasources/remote_datasource.dart';
import 'package:booking_app/features/auth/data/datasources/update_profile_info__remote_data_source/update_profile_info_remote_data_source.dart';
import 'package:booking_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:booking_app/features/auth/domain/usecases/change_password.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_local_data_source.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:booking_app/features/hotels/data/datasources/search_hotel_data_source/search_hotel_remote_data_source.dart';
import 'package:booking_app/features/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:booking_app/features/hotels/domain/entities/create_booking_entity.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_bookings.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_hotels.dart';
import 'package:booking_app/features/hotels/domain/usecases/search_hotels.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

import '../../../features/auth/data/datasources/get_profile_info__remote_data_source/get_profile_info_remote_data_source.dart';
import '../../../features/auth/domain/entities/getProfileEntity.dart';
import '../../../features/hotels/data/datasources/create_booking_data_source/create_booking_data_source.dart';
import '../../../features/hotels/data/datasources/get_booking_data_source/get_booking_data_source.dart';
import '../../../features/hotels/data/datasources/get_hotel_remote_data_source.dart';
import '../../../features/hotels/domain/usecases/create_booking.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio(sl()));
  sl.registerLazySingleton<UserModelEntity>(() => UserModelEntity());
  sl.registerLazySingleton<CreateBookingEntity>(() => CreateBookingEntity());
  sl.registerLazySingleton<ProfileModelEntity>(() => ProfileModelEntity());
  sl.registerLazySingleton<BaseOptions>(() => BaseOptions());
  //Cubits
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      updateProfileUseCase: sl(),
      registerUseCase: sl(),
      getProfileInfoUseCase: sl(),
      userModelEntity: sl(),
      profileModelEntity: sl(),
    ),
  );
  sl.registerFactory(
    () => AppCubit(sl(), sl(), sl(), sl()),
  );

  //Usecases
  sl.registerLazySingleton(() => GetHotelsUseCase(hotelsRepository: sl()));
  sl.registerLazySingleton(() => SearchHotelsUseCase(hotelsRepository: sl()));
  sl.registerLazySingleton(() => CreateBookingUseCase(hotelsRepository: sl()));
  sl.registerLazySingleton(() => GetBookingsUseCase(hotelsRepository: sl()));

  sl.registerLazySingleton(() => UpdateProfileUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProfileInfoUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getProfileInfoDataSource: sl(),
      loginDataSource: sl(),
      registerUserDataSource: sl(),
      updateProfileInfoDataSource: sl(),
      // remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<HotelsRepository>(
    () => HotelsRepositoryImpl(
      createBookingDataSource: sl(),
      getBookingDataSource: sl(),
      searchHotelService: sl(),
      getHotelService: sl(),
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  //Datasources
  sl.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<GetHotelService>(() => GetHotelService(sl()));
  sl.registerLazySingleton<CreateBookingDataSource>(
      () => CreateBookingDataSource(sl()));
  sl.registerLazySingleton<SearchHotelService>(() => SearchHotelService(sl()));
  sl.registerLazySingleton<HotelsRemoteDatasource>(
      () => HotelsRemoteDatasourceImpl(client: sl()));
  sl.registerLazySingleton<GetProfileInfoDataSource>(
      () => GetProfileInfoDataSource(sl()));
  sl.registerLazySingleton<GetBookingDataSource>(
          () => GetBookingDataSource(sl()));
  sl.registerLazySingleton<RegisterUserDataSource>(
      () => RegisterUserDataSource(sl()));
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSource(sl()));
  sl.registerLazySingleton<UpdateProfileInfoDataSource>(
      () => UpdateProfileInfoDataSource(sl()));
  sl.registerLazySingleton<HotelsLocalDatasource>(
      () => HotelsLocalDatasourceImpl(sharedPreferences: sl()));
  //Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //shared preferences

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //http
  sl.registerLazySingleton(() => http.Client());

  //Internet connection checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
