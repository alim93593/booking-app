import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/widget/Custom_form_field/text_form_field.dart';
import 'package:booking_app/core/utils/widget/no_account/no_account.dart';
import 'package:booking_app/features/auth/presntation/cubit/login_cubit.dart';
import 'package:booking_app/features/auth/presntation/cubit/login_state.dart';
import 'package:booking_app/features/auth/presntation/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widget/main_button/mainbutton.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailAddressController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController =  TextEditingController();
    var passwordConfirmationController = TextEditingController();
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 150.0,
                            child: Image.asset('images/logotest.png'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'REGISTER',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.black,
                                      fontFamily: 'Ubuntu',
                                    ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Sing up now and explore wonderful hotels',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.grey,
                                      fontFamily: 'Ubuntu',
                                    ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          CustomFormField(
                            Controller: nameController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your name ';
                              }
                            },
                            textInputType: TextInputType.emailAddress,
                            prefix: Icon(Icons.email_outlined),
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            Controller: emailAddressController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email ';
                              }
                            },
                            textInputType: TextInputType.emailAddress,
                            prefix: Icon(Icons.email_outlined),
                            hintText: 'Email Address',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            Controller: passwordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short ';
                              }
                            },
                            textInputType: TextInputType.visiblePassword,
                            prefix: Icon(Icons.lock_outline),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',
                            ),
                            style: const TextStyle(
                              color: Colors.black,
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
                            Controller: passwordConfirmationController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short ';
                              }
                            },
                            textInputType: TextInputType.visiblePassword,
                            prefix: Icon(Icons.lock_outline),
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',
                            ),
                            style: const TextStyle(
                              color: Colors.black,
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
                            myStyle: const Text(
                              'REGISTER',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            myColor: mainColor,
                            onTabbed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DoNotHaveAccount(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil<void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        LoginScreen()),
                                ModalRoute.withName('/'),
                              );
                            },
                            label: 'already have an account !',
                            btnLabel: 'Log in ',
                          ),
                        ]),
                  ),
                ),
              ),

          );
        },
      ),
    );
  }
}
