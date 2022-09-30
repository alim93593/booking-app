// ignore_for_file: constant_identifier_names

import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../local/cache_helper.dart';

const String defaultUserImage = '';


 signOut(BuildContext context){
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> const LoginScreen()));
    }
  });
}


navigateAndFinish({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) {
      return route;
    }),
        (route) => false,
  );
}

navigateTo({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return route;
  }));
}

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 10.0,
    ),
  )
      .close;
}

String mapFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ApiFailure:
      return API_FAILURE_MESSAGE;

    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;

    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;

    default:
      return "Unexpected failure, please try again later";
  }
}