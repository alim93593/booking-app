import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/core/utils/injection/injection_container.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/bookings_screens/widget/Booking_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class CompletedBookings extends StatelessWidget {
  const CompletedBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardColor = ModeCubit.get(context).isDark == true
        ? Colors.black
        : const Color(0xffffffff);
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return BlocProvider(
      create: (context) => AppCubit(sl(), sl(), sl(), sl(), sl())
        ..getCompletedBooking(
            token: CacheHelper.getData(key: 'toKen'),
            count: 10,
            type: 'completed'),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        var cubit = AppCubit.get(context);

        return ConditionalBuilder(

          condition: cubit.completed.isNotEmpty,
          builder:  (context) =>ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                height: 130,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(fit: StackFit.expand, children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                          'http://api.mahmoudtaha.com/images/${cubit.completed[index].hotel!.hotelImages![0].image!}',
                          width: 170,
                          height: 130,
                          fit: BoxFit.cover),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.completed[index].hotel!.name!.substring(0,14),
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
                                cubit.completed[index].
                                    hotel!
                                    .address!.substring(0,28),

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
                            children:  [
                              Icon(
                                Icons.star,
                                color: Color(0xffFFD700),
                              ),
                              Text(
                                '${ cubit.completed[index].hotel!.rate}',
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
                                ' ${cubit.completed[index].hotel!.price}',
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
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              cubit.updateCompletedBooking(
                                  type: 'completed',
                                  bookingId:cubit.completed[index]
                                      .id!, token: CacheHelper.getData(key: 'toKen'));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.grey,
                              size: 20,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                            onPressed: () {
                              cubit.updateCancelledBooking(
                                  type: 'cancelled',
                                  bookingId:cubit.completed[index]
                                      .id!, token: CacheHelper.getData(key: 'toKen'));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.trashCan,
                              color: Colors.grey,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: cubit.completed.length,
          ),
          fallback: (context) =>  Center(
            child: Container(
              child: Lottie.asset(
                'assets/lotties/loading.json',
                height: 120,
                width: 120,
              ),
            ),
          ),

        );
      }),
    );
  }
}
