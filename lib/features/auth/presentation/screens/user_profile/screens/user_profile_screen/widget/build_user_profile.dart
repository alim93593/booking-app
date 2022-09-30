// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, unused_import, avoid_print, prefer_const_constructors_in_immutables, unrelated_type_equality_checks, unnecessary_string_interpolations, unused_local_variable, deprecated_member_use

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/core/utils/injection/injection_container.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/data/user_profile_model.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/change_password/screen/change_password_screen.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/divider.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/update_user_profile.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/screens/google_maps/screens/map_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildUserProfile extends StatelessWidget {
  BuildUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AuthCubit(
          loginUseCase: sl(),
          registerUseCase: sl(),
          getProfileInfoUseCase: sl(),
          updateProfileUseCase: sl(),
          userModelEntity: sl(),
          profileModelEntity: sl())
        ..getProfileInfo(
            token:
            CacheHelper.getData(key: 'toKen')),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          var cubit = AuthCubit.get(context);
          return ConditionalBuilder(
              condition: state is GetProfileSuccessState,
              builder: (context) {
                var color = ModeCubit.get(context).isDark == true
                    ? const Color(0xffffffff)
                    : const Color(0xff212525);
                var cardColor = ModeCubit.get(context).isDark == true
                    ?  const Color(0xff212525)
                    : const Color(0xffffffff);
                var profileState = GetProfileSuccessState(profileModelEntity: cubit.profileModelEntity);
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
                            color: cardColor,
                            child: InkWell(
                              onTap: () {
                                navigateTo(
                                    context: context,
                                    route: UpdateUserProfile());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '${profileState.profileModelEntity.data?.name}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                ' Update Your Profile ',
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
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            children: [
                                              CircleAvatar(
                                                radius: 64.0,
                                                child: CircleAvatar(
                                                  radius: 60.0,
                                                  backgroundColor: Theme.of(
                                                          context)
                                                      .scaffoldBackgroundColor,
                                                  backgroundImage: NetworkImage(
                                                      'http://api.mahmoudtaha.com/images/${profileState.profileModelEntity.data?.image}'),
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
                          ProfileItem(
                              itemName: 'Change Password',
                              color: color,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                               color: color,
                              ),
                              onPressed: () {
                                navigateTo(
                                    context: context,
                                    route: ChangePasswordScreen());
                              }),
                          ProfileItem(
                            itemName: 'Theme Mode',
                            color: color,
                            icon: Icon(
                              FontAwesomeIcons.lightbulb,
                              color: color,
                            ),
                            onPressed: () {
                              ModeCubit.get(context).changeAppMode();
                            },
                          ),
                          ProfileItem(
                            itemName: 'Invite Friend',
                            color: color,
                            icon: Icon(
                              FontAwesomeIcons.userFriends,
                              color: color,
                            ),
                            onPressed: () {},
                          ),
                          ProfileItem(
                            itemName: 'Credit Coupons',
                            color: color,
                            icon: Icon(
                              FontAwesomeIcons.gift,
                              color: color,
                            ),
                          ),
                          ProfileItem(
                            itemName: 'Log Out',
                            color: color,
                            icon: Icon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              color: color,
                            ),
                            isLast: true,
                            // onPressed: signOut(context),
                          ),
                        ]),
                  ),
                );
              },
              fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.color,
    this.onPressed,
    required this.itemName,
    required this.icon,
    this.isLast = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color color;
  final String itemName;
  final Widget icon;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              IconButton(
                icon: icon,
                onPressed: onPressed,
              ),
            ],
          ),
          isLast ? SizedBox.shrink() : MyDivider(),
        ],
      ),
    );
  }
}
