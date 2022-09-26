// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, unused_import, avoid_print, prefer_const_constructors_in_immutables, unrelated_type_equality_checks, unnecessary_string_interpolations, unused_local_variable

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/core/utils/injection/injection_container.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/data/user_profile_model.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/change_password/screen/change_password_screen.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/update_user_profile.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:flutter/material.dart';

class BuildUserProfile extends StatelessWidget {
  BuildUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
  var cubit = AuthCubit.get(context);
  var main = cubit.getProfileInfo(token: toKen);

    return Scaffold(
        // backgroundColor: ModeCubit.get(context).isDark?Colors.black:Colors.white,
        appBar: appbar(
          context: context,
          title: 'Edit Profile',
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color:ModeCubit.get(context).isDark?Colors.black:Colors.white,
                child: InkWell(
                  onTap: (){
                    navigateTo(context: context, route: UpdateUserProfile());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topStart,
                              children:  [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${'Ali Mahmoud'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.topStart,
                              children:  [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'View And Update Your Profile ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: color),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 170.0,
                          padding: EdgeInsets.all(20),
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 64.0,
                                    child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      backgroundImage: AssetImage(
                                          'assets/on_boarding/splash.jpg'),
                                    ),
                                  ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: CircleAvatar(
                                  //         radius: 20.0,
                                  //         child: Icon(
                                  //           Icons.add_a_photo_rounded,
                                  //           size: 20,
                                  //         ))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: SettingsListData.userSettingsList.length,
                itemBuilder: (context, index) {
                  // print(SettingsListData.userSettingsList[index].titleTxt);
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              SettingsListData.userSettingsList[index].titleTxt,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                  color: color,
                              ),
                            ),
                            IconButton(
                              icon:Icon( SettingsListData.userSettingsList[index].iconData,color:  ModeCubit.get(context).isDark?Colors.white:Colors.black,),
                              onPressed: () {
                                if(index==0){
                                  navigateTo(context: context, route: ChangePasswordScreen());
                                }

                            },)
                          ],
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
