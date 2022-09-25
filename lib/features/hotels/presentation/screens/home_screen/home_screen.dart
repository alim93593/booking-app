// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import

import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/imageSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var cubit = AppCubit.get(context);
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: ImageSlider(
                maxExtent: height / 1.6,
                minExtent: 240,
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'Best deals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  onTap: () {},
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1615460549969-36fa19521a4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGhvdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                            width: 100,
                            height: 110,
                            fit: BoxFit.fill),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                '${cubit.hotels?[index].name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children:  [
                                  Icon(
                                    Icons.place_outlined,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.hotels?[index].address}',
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
                                    text: '\$${cubit.hotels?[index].price}',
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
    );
  }
}
