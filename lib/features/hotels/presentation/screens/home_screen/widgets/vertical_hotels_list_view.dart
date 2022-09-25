import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/injection/injection_container.dart';

class VerticalHotelsListView extends StatelessWidget {
  const VerticalHotelsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(sl())..getHotels(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return SizedBox(
            width: double.infinity,
            height: 260,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,

                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), // changes position of shadow
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
                              'http://api.mahmoudtaha.com/images/${cubit.hotels?[index].hotelImages![0].image}',
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
                                '${cubit.hotels?[index].name}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.place_outlined,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Sharm Al Sheikh',
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
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFD700),
                                  ),
                                  Text(
                                    '4.7(150+)',
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
                              const Text.rich(
                                TextSpan(
                                    text: '\$69.99',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <InlineSpan>[
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
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.grey,
                              size: 20,
                            )),
                      ),
                    ]),
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 20,
                ),
                itemCount: cubit.hotels?.length??0),
          );
        },
      ),
    );
  }
}