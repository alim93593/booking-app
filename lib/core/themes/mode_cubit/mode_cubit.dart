// ignore_for_file: unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:booking_app/core/themes/mode_cubit/cubit_state.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ModeCubit extends Cubit<ModeStates> {
  ModeCubit() : super(ModeInitialState());
  static ModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppModeState());
    } else{
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }

  }
}