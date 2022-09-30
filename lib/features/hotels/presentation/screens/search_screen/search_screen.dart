import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
// ignore_for_file: unused_local_variable

import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/deatils_screen/hotel_deatils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/injection/injection_container.dart';
import '../../../../../../core/widget/custom_text_form_field.dart';
import 'dart:math' as math;

import '../../../../auth/presentation/cubit/auth_cubit.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = 'SearchScreen';
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => AppCubit(sl(), sl(),sl(),sl(),sl()),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            var color = ModeCubit.get(context).isDark == true
                ? const Color(0xffffffff)
                : const Color(0xff212525);
            var cardColor = ModeCubit.get(context).isDark == true
                ? const Color(0xff212525)
                : const Color(0xffffffff);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text('Search'),
                centerTitle: true,
              ),
              body: Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomFormField(
                        controller: searchController,
                        onFieldSubmitted: (String name) {
                          AppCubit.get(context).getSearch(name: name);
                        },
                        hintText: 'Search',
                         style: TextStyle(
                           color: color
                         ),
                        prefix:  Icon(Icons.search, color: color,),
                        textInputType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter text to search';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (state is SearchLoadingState)
                        const LinearProgressIndicator(),
                      if (state is SearchSuccessState)
                        Expanded(
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 8.0, left: 8.0, bottom: 8),
                                  child: InkWell(
                                    onTap: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HotelDetails(
                                              hotelId: cubit.hotels![index].id!.toInt(),
                                              userId:AuthCubit.get(context).userModelEntity.data!.id!.toInt() ,
                                              latitude: cubit.searchHotels![index].latitude!,
                                              longitude:  cubit.searchHotels![index].longitude!,
                                              address: cubit.searchHotels![index].address!,
                                              description: cubit.searchHotels![index].description!,
                                              hotelName: cubit.searchHotels![index].name!,
                                              price: cubit.searchHotels![index].price!,
                                              rate: cubit.searchHotels![index].rate!,
                                            ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 130,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color:cardColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child:
                                          Stack(fit: StackFit.expand, children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.network(
                                                'http://api.mahmoudtaha.com/images/${cubit.searchHotels![index].hotelImages![math.Random().nextInt(cubit.searchHotels![index].hotelImages!.length)]}',
                                              fit: BoxFit.cover,
                                            width: 175,
                                              height: 130,
                                            ),
                                        ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.topEnd,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 180,
                                              top: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cubit
                                                      .searchHotels![index]
                                                      .name!,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: color,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.place_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      cubit
                                                          .searchHotels![index]
                                                          .address!.substring(0,15),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Color(0xffFFD700),
                                                    ),
                                                    Text(
                                                      cubit
                                                          .searchHotels![index]
                                                          .rate!,
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                      text:
                                                          '\$${cubit.searchHotels![index].price!}',
                                                      style: const TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      children: const <
                                                          InlineSpan>[
                                                        TextSpan(
                                                          text: ' /night',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ]),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemCount:
                                  AppCubit.get(context).searchHotels!.length),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
