// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, sized_box_for_whitespace

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/deatils_screen/hotel_deatils.dart';
import 'package:booking_app/features/hotels/presentation/screens/google_maps/screens/map_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/imageSlider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

import '../../../../auth/presentation/cubit/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var color = ModeCubit.get(context).isDark == true
            ? const Color(0xffffffff)
            : const Color(0xff212525);
        var cardColor = ModeCubit.get(context).isDark == true
            ? const Color(0xff212525)
            : const Color(0xffffffff);
        return Scaffold(
          body: ConditionalBuilder(
            condition: cubit.hotels != null,
            builder: (context) => CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: ImageSlider(
                    maxExtent: height / 1.6,
                    minExtent: 240,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Row(
                      children: [
                        Container(
                            width: 20,
                            child: IconButton(
                                onPressed: () {
                                  navigateTo(
                                      context: context,
                                      route: MapPage(
                                          latitude:
                                              '${cubit.hotels![0].longitude!}',
                                          longitude:
                                              ' ${cubit.hotels![0].latitude!}'));
                                },
                                icon: Icon(
                                  Icons.location_city,
                                  color: Colors.yellow,
                                ))),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Best deals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, left: 8.0, bottom: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HotelDetails(
                                      latitude: cubit.hotels![index].latitude!,
                                      longitude:
                                          cubit.hotels![index].longitude!,
                                      address: cubit.hotels![index].address!,
                                      description:
                                          cubit.hotels![index].description!,
                                      hotelName: cubit.hotels?[index].name,
                                      price: cubit.hotels?[index].price,
                                      rate: cubit.hotels?[index].rate,   hotelId: cubit.hotels![index].id!.toInt(),
                                  userId:AuthCubit.get(context).userModelEntity.data?.id?.toInt()??1 ,
                                    )),
                          );
                        },
                        child: Card(
                          color: cardColor,
                          elevation: 3,
                          shadowColor: color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                  image: NetworkImage(
                                      'http://api.mahmoudtaha.com/images/${cubit.hotels![index].hotelImages![math.Random().nextInt(cubit.hotels![index].hotelImages!.length)]}'),
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.fill),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cubit.hotels?[index].name?.substring(0, 14)}',
                                      style: TextStyle(
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
                                        Icon(
                                          Icons.place_outlined,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          '${cubit.hotels?[index].address!.substring(0, 28)}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffFFD700),
                                        ),
                                        Text(
                                          '${cubit.hotels?[index].rate}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
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
                                              '\$${cubit.hotels?[index].price}',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: const <InlineSpan>[
                                            TextSpan(
                                              text: '/night',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: cubit.hotels?.length,
                ))
              ],
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
