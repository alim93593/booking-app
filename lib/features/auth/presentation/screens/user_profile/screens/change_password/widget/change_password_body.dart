// ignore_for_file: avoid_print, must_be_immutable, prefer_const_constructors, unused_import

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_button.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/my_input_feild.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBody extends StatelessWidget {
  ChangePasswordBody({Key? key}) : super(key: key);
  String? passwordConformation;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit
        .get(context)
        .isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Change Password',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 20,
                color: color,

              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 24, right: 24),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Enter Your New Password",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomFormField(
                          controller: newPasswordController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be  empty';
                            } else if (value.length < 6) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          textInputType: TextInputType.visiblePassword,
                          prefix: const Icon(Icons.lock_outline),
                          hintText: ' New Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Ubuntu',
                          ),
                          style: TextStyle(
                            color: color,
                            fontFamily: 'Ubuntu',
                          ),
                          suffix: cubit.suffix,
                          isPassWord: cubit.isPassword,
                          suffixPressed: () {
                            cubit.changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          controller: newPasswordConfirmationController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be empty';
                            } else if (value != newPasswordController.text) {
                              return 'Password miss match';
                            }
                            return null;
                          },
                          textInputType: TextInputType.visiblePassword,
                          prefix: const Icon(Icons.lock_outline),
                          hintText: 'Confirm New Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Ubuntu',
                          ),
                          style:  TextStyle(
                            color: color,
                            fontFamily: 'Ubuntu',
                          ),
                          suffix: cubit.suffix,
                          isPassWord: cubit.isPassword,
                          suffixPressed: () {
                            cubit.changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultButton(text: 'Change Password', function: () {

                        },)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

        );
      },
    );
  }
}
