// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace

import 'package:booking_app/features/auth/presentation/screens/user_profile/widget/custom_app_bar.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/widget/custom_button.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/widget/my_input_feild.dart';
import 'package:flutter/material.dart';

class BuildUserProfile extends StatelessWidget {
   BuildUserProfile({Key? key}) : super(key: key);
  var name = TextEditingController();
  var email = TextEditingController();
  var newPassword = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        appBar:appbar(
          context: context,
          title: 'Edit Profile',
          mycolor: Colors.black,
          isLeading: true,
          myIcon: Icons.arrow_back_ios
        ),
        body:  Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                  MyInputFeild(
                    isTextPassword: true,
                    controller: name,
                    type: TextInputType.name,
                    validate: ( value){
                      if(value.isEmpty){
                        return 'Name Must not be Empty';
                      }
                      return null;
                    },
                    label: 'User Name',
                    prefix: Icons.supervised_user_circle,
                    hint: '',
                  ),
                  SizedBox( height: 30.0),
                  MyInputFeild(
                      isTextPassword: true,
                      hint: '',
                      controller:email,
                      type: TextInputType.emailAddress,
                      validate: ( value){
                        if(value.isEmpty){
                          return 'Email Must not be Empty';
                        }
                        if(!value.toString().contains('@')){
                          return 'Please Enter Avalid Email Address';
                        }
                        if(!value.toString().contains('.com')){
                          return 'Please Enter Avalid Email Address';
                        }
                        return null;
                      },
                      label: 'Email',
                      prefix: Icons.phone
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
        )
    );
  }
}
