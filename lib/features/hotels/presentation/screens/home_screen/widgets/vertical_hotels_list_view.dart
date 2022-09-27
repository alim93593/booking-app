// ignore_for_file: prefer_const_constructors

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerticalHotelsListView extends StatelessWidget {
  const VerticalHotelsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardColor = ModeCubit.get(context).isDark == true
        ? Colors.black
        : const Color(0xffffffff);
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return ListView.separated(
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
                          'https://images.unsplash.com/photo-1615460549969-36fa19521a4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGhvdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
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
                            'Century Park Hotel',
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
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.grey,
                              size: 20,
                            )),
                        SizedBox(height: 30,),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.trashCan,
                              color: Colors.grey,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ]
                ),
              );

            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 10,
    );

  }
}