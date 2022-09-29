import 'dart:math' as math;

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/deatils_screen/hotel_deatils.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/search_screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    AppCubit.get(context).getHotels(
      isForce: true,
    );

    scrollController.addListener(() {
      if (scrollController.position.extentAfter == 0 &&
          !AppCubit.get(context).isEnd &&
          AppCubit.get(context).lastPage >= AppCubit.get(context).currentPage) {
        debugPrint('maxScrollExtent');
        AppCubit.get(context).toggleIsEnd();
        AppCubit.get(context).getHotels();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is FailureState) {}
      },
      builder: (context, state) {
        var color = ModeCubit.get(context).isDark == true
            ? const Color(0xffffffff)
            : const Color(0xff212525);
        var cardColor = ModeCubit.get(context).isDark == true
            ?  const Color(0xff212525)
            : const Color(0xffffffff);
        var cubit = AppCubit.get(context);
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPersistentHeader(
              pinned: false,
              delegate: SliverAppBarDelegate(
                minHeight: 55.0,
                maxHeight: 55.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(14.0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: SliverAppBarDelegate(
                minHeight: 30.0,
                maxHeight: 30.0,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 30.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Text(
                    '${AppCubit.get(context).hotels!.length} Hotel',
                    style:  TextStyle(
                      fontSize: 14,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (AppCubit.get(context).hotels != null)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: InkWell(
                          onTap: (){
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
                                    rate: cubit.hotels?[index].rate,
                                  )),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300]!,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Image(
                                        image: NetworkImage(
                                            'http://api.mahmoudtaha.com/images/${cubit.hotels![index].hotelImages![math.Random().nextInt(cubit.hotels![index].hotelImages!.length)]}'),
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppCubit.get(context)
                                                  .hotels![index]
                                                  .name!,
                                              style:  TextStyle(
                                                fontSize: 16,
                                                color: color,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
                                                    text: ' /night',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.amber,
                                            size: 24,
                                          ),
                                          Text(
                                            AppCubit.get(context)
                                                .hotels![index]
                                                .rate!,
                                            style:  TextStyle(
                                              fontSize: 16,
                                              color: color,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: AppCubit.get(context).hotels!.length,
                    ),
                  if (AppCubit.get(context).hotels != null)
                    const CupertinoActivityIndicator(),
                  if (AppCubit.get(context).isEnd)
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 14.0,
                        bottom: 100.0,
                      ),
                      child: CupertinoActivityIndicator(),
                    ),
                ],
              ),
            ),
          ],
        );

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(14.0),
                      child: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                '540 Hotel',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        const Image(
                          image: NetworkImage(
                              'https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg'),
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'Bellagio Hotel & Casino',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '200\$',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 24,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: 10,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    // debugPrint('progress => $progress');

    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
