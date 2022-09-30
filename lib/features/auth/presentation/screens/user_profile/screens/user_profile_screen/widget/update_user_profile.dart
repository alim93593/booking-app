// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/core/widget/toast.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/utils/constants/strings.dart';
import '../../../../../../../../core/utils/injection/injection_container.dart';

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
    return BlocProvider(
      create: (context) => AuthCubit(
          loginUseCase: sl(),
          registerUseCase: sl(),
          getProfileInfoUseCase: sl(),
          updateProfileUseCase: sl(),
          userModelEntity: sl(),
          profileModelEntity: sl())
        ..getProfileInfo(token:'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u'),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          var profileimage = cubit.profileimage;

          return ConditionalBuilder(
              condition: state is GetProfileSuccessState || profileimage!=null,
              builder: (context) {
                var profileState = GetProfileSuccessState(
                    profileModelEntity: cubit.profileModelEntity);
                name.text = profileState.profileModelEntity.data!.name.toString();
                email.text = profileState.profileModelEntity.data!.email.toString();
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
                    body: Form(
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
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
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
                                                backgroundImage: profileimage== null?
                                                NetworkImage('${profileState.profileModelEntity.data?.image}'):
                                                FileImage(profileimage)as ImageProvider
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  cubit.getprofileimage();
                                                },
                                                icon: CircleAvatar(
                                                    radius: 20.0,
                                                    child: Icon(
                                                      Icons.add_a_photo_rounded,
                                                      size: 20,
                                                    ))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                CustomFormField(
                                  controller: name,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  textInputType: TextInputType.emailAddress,
                                  prefix:
                                      const Icon(Icons.perm_identity_outlined),
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
                                  style: TextStyle(
                                    color: color,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                DefaultButton(
                                  text: 'Update  Profile',
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      if(profileimage!=null){
                                        await cubit
                                            .updateProfileInfo(
                                            token: toKen,
                                            name: name.text,
                                            email: email.text,
                                            image: Uri.file(profileimage.path).pathSegments.last)
                                            .then((value) =>
                                            Navigator.pop(context));
                                         showToast(text: 'Profile Has Been Updated Successfully', state: ToastState.SUCCESS);
                                        /// update user profile
                                        debugPrint('success');
                                      }else{
                                        await cubit
                                            .updateProfileInfo(
                                            token: toKen,
                                            name: name.text,
                                            email: email.text,
                                            image: profileState.profileModelEntity.data?.image)
                                            .then((value) =>
                                            Navigator.pop(context));
                                      }
                                      showToast(text: 'Unable To Update Profile', state: ToastState.ERROR);
                                      /// update user profile
                                      debugPrint('success');
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
              },
              fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}
