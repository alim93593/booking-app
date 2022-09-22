import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/core/widget/main_button.dart';
import 'package:booking_app/core/widget/no_account.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({Key? key}) : super(key: key);
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showSnackBar(context, 'User registered successfully');
          navigateTo(context: context, route:  HomeScreen());
        }
        if (state is RegisterErrorState) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
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
                      style: const TextStyle(
                        color: Colors.black,
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
                      prefix: const Icon(Icons.lock_outline),
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
                      height: 60.0,
                      width: double.infinity,
                      myStyle: const Text(
                        'REGISTER',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      myColor: mainColor,
                      onTabbed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.registerUser(
                              name: nameController.text,
                              email: emailAddressController.text,
                              password: passwordController.text,
                              passwordConfirm:
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
    );
  }
}
