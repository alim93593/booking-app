import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/data/datasources/remote_datasource.dart';
import 'package:booking_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:booking_app/features/auth/domain/usecases/change_password.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_local_data_source.dart';
import 'package:booking_app/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:booking_app/features/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:booking_app/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_hotels.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/hotels/data/datasources/get_hotel_remote_data_source.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(
          () => Dio( sl()));
  sl.registerLazySingleton<BaseOptions>(
          () => BaseOptions());
  //Cubits
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      updateProfileUseCase: sl(),
      registerUseCase: sl(),
      getProfileInfoUseCase: sl(),
    ),
  );
  sl.registerFactory(
        () => AppCubit(
     sl()
    ),
  );

  //Usecases
  sl.registerLazySingleton(() => GetHotelsUseCase( hotelsRepository:  sl()));

  sl.registerLazySingleton(() => UpdateProfileUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProfileInfoUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<HotelsRepository>(
        () => HotelsRepositoryImpl(
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
  sl.registerLazySingleton<GetHotelService>(
          () => GetHotelService(sl()));

  sl.registerLazySingleton<HotelsRemoteDatasource>(
          () => HotelsRemoteDatasourceImpl(client: sl()));
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
