// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_button.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/my_input_feild.dart';
import 'package:flutter/material.dart';

class UpdateUserProfile extends StatelessWidget {
   UpdateUserProfile({Key? key}) : super(key: key);
  var name = TextEditingController();
  var email = TextEditingController();
  var newPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Profile',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              color: color,

            ),
          ),
        ),
        body:  Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      height: 190.0,
                      child: Center(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 64.0,
                                  child: CircleAvatar(
                                    radius: 60.0,
                                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                    backgroundImage:AssetImage('assets/on_boarding/splash.jpg'),
                                  ),
                                ),
                                IconButton(onPressed: (){
                                }, icon: CircleAvatar(
                                    radius: 20.0,
                                    child: Icon(Icons.add_a_photo_rounded,size: 20,))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35,),
                    CustomFormField(
                      controller: name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                      prefix: const Icon(Icons.perm_identity_outlined),
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
                      controller: email,
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
                    SizedBox(height: 50,),
                    DefaultButton(text: 'Update Profile',function: ()async{
                      if(formKey.currentState!.validate()) {
                        /// update user profile
                        debugPrint('success');
                      }
                    },)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
