// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/core/widget/main_button.dart';
import 'package:booking_app/core/widget/no_account.dart';
import 'package:booking_app/core/widget/toast.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:booking_app/features/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_layout/home_layout.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/injection/injection_container.dart';


class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthCubit(loginUseCase: sl(), registerUseCase:  sl(), getProfileInfoUseCase:  sl(), updateProfileUseCase:  sl(),userModelEntity: sl(),profileModelEntity: sl()),
  child: BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast(text: state.userModelEntity.status!.title!.ar!, state: ToastState.SUCCESS);
          CacheHelper.saveData(
              key: 'toKen',
              value:state.userModelEntity.data!.apiToken
          ).then((value) async {
            toKen=state.userModelEntity.data!.apiToken!;
            navigateAndFinish(context: context, route: HomeLayout(),);
          });
        }
        if (state is LoginErrorState) {
          showToast(text: state.userModelEntity?.status?.title?.ar??'', state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        var color = ModeCubit.get(context).isDark == true
            ? const Color(0xffffffff)
            : Colors.black;
        var cardColor = ModeCubit.get(context).isDark == true
            ?  const Color(0xff212525)
            : const Color(0xffffffff);
        var cubit = AuthCubit.get(context);
        return Center(
          child: SingleChildScrollView(
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
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: color,
                              fontFamily: 'Ubuntu',
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Login now and explore wonderful hotels',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',

                                                         ),
                      ),
                      const SizedBox(
                        height: 30.0,
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
                        prefix:  Icon(Icons.email_outlined,
                        color: color,
                        ),
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Ubuntu',
                        ),
                        style:  TextStyle(
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
                          if (value!.isEmpty || value.length < 6) {
                            return 'password is too short';
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        prefix:  Icon(Icons.lock_outline,
                          color: color,
                        ),
                        hintText: 'Password',
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
                        height: 30,
                      ),
                      MainButton(
                        height: 60.0,
                        width: double.infinity,
                        myStyle: const Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        myColor: mainColor,
                        onTabbed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                                email: emailAddressController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DoNotHaveAccount(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                        },
                        label: 'Don\'t have an account !',
                        btnLabel: 'Sign Up',
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
