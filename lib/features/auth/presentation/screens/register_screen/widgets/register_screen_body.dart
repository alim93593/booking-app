// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/core/widget/main_button.dart';
import 'package:booking_app/core/widget/no_account.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:booking_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/injection/injection_container.dart';
import '../../../../../../core/utils/local/cache_helper.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({Key? key}) : super(key: key);
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? token;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
          loginUseCase: sl(),
          registerUseCase: sl(),
          getProfileInfoUseCase: sl(),
          updateProfileUseCase: sl(),
          userModelEntity: sl(),
          profileModelEntity: sl()),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.userModelEntity.status!.type == '1') {
              // showToast(text: state.userModelEntity.status!.title!.ar!, state: ToastState.SUCCESS);
              print(state.userModelEntity.data!.apiToken);
              // print(state.login.message);
              CacheHelper.saveData(
                      key: 'token', value: state.userModelEntity.data!.apiToken)
                  .then((value) {
                token = state.userModelEntity.data!.apiToken;
              });
              print(state.userModelEntity.status!.title);
              navigateTo(context: context, route: LoginScreen());
            }
          }
          if (state is RegisterErrorState) {
            // showToast(text: state.userModelEntity!.status!.title!.ar!, state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          var color = ModeCubit.get(context).isDark == true
              ? const Color(0xffffffff)
              : Colors.black;
          var cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 150.0,
                        child: Image.asset('assets/images/logo_test.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Sign up now and explore wonderful hotels',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',
                            ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomFormField(
                        controller: nameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        textInputType: TextInputType.emailAddress,
                        prefix: const Icon(Icons.email_outlined),
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Ubuntu',
                        ),
                        style: TextStyle(
                          color: color,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormField(
                        controller: emailAddressController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email ';
                          }
                          return null;
                        },
                        textInputType: TextInputType.emailAddress,
                        prefix: const Icon(Icons.email_outlined),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Ubuntu',
                        ),
                        style: TextStyle(
                          color: color,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormField(
                        controller: passwordController,
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
                        hintText: 'Password',
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
                        controller: passwordConfirmationController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password can\'t be empty';
                          } else if (value != passwordController.text) {
                            return 'Password miss match';
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        prefix: Icon(
                          Icons.lock_outline,
                          color: color,
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
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
                        height: 30,
                      ),
                      MainButton(
                        height: 60.0,
                        width: double.infinity,
                        myStyle: const Text(
                          'REGISTER',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        myColor: mainColor,
                        onTabbed: () async {
                          if (formKey.currentState!.validate()) {
                            await cubit.userRegister(
                                name: nameController.text,
                                email: emailAddressController.text,
                                password: passwordController.text,
                                password_confirmation:
                                    passwordConfirmationController.text);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DoNotHaveAccount(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'Already have an account !',
                        btnLabel: 'Log in',
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
