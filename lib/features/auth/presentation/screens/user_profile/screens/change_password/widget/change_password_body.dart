// ignore_for_file: avoid_print, must_be_immutable, prefer_const_constructors

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_button.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/my_input_feild.dart';
import 'package:flutter/material.dart';

class ChangePasswordBody extends StatelessWidget {
   ChangePasswordBody({Key? key}) : super(key: key);
  String? passwordConformation;
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    var cubit = AuthCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(
        context: context,
        title: 'Change Password',
        myIcon: Icons.arrow_back_ios,
          ontap: (){
            Navigator.pop(context);
          }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MyInputFeild(
                    isTextPassword: true,
                    label: 'New Password',
                    hint: 'New Password',
                    controller: newController,
                    suffix: Icons.visibility_outlined,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock_outline,
                    sufixpressed: (){
                      cubit.changePasswordVisibility();
                    },
                    ispassword:  cubit.isPassword ,
                    validate: ( value){
                      passwordConformation=value;
                      print(passwordConformation);
                      if(value.isEmpty){
                        return 'Please Enter Your Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox( height: 20.0),
                  MyInputFeild(
                    isTextPassword: true,
                    label: 'Confirm Password',
                    hint: 'Confirm Password',
                    controller: confirmController,
                    suffix: Icons.visibility_outlined,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock_outline,
                    sufixpressed: (){
                      cubit.changePasswordVisibility();
                    },
                    ispassword: cubit.isPassword ,
                    validate: ( value){
                      if(value.isEmpty){
                        return 'Please Enter Your Password';
                      }
                      if(value.toString().trim()!=passwordConformation){
                        return 'Please Confirm Your Password As Same';
                      }
                      return null;
                    },
                  ),
                  SizedBox( height: 20.0),
                  DefaultButton(text: 'Change Password',function: (){

                  },)
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
