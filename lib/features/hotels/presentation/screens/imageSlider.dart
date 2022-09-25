// ignore_for_file: file_names, implementation_imports, annotate_overrides

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class ImageSlider implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  ImageSlider({
    required this.minExtent,
    required this.maxExtent,
  });
  List images = [
    'https://images.pexels.com/photos/1580112/pexels-photo-1580112.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2467558/pexels-photo-2467558.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2263510/pexels-photo-2263510.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var top = 0.0;
    return Stack(
      children: [
        CarouselSlider(
          items: images
              .map((e) => Image(
                    image: NetworkImage(e.toString()),
                    fit: BoxFit.cover,
                    width: 1000.0,
                    height: 300,
                  ))
              .toList(),
          options: CarouselOptions(
            height: maxExtent,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: 0,
            reverse: false,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            enableInfiniteScroll: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),
                    Text(
                      'search your hotel',
                      style: TextStyle(
                          color: Colors.black38,

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        shrinkOffset >= 0 && shrinkOffset < 50
            ? Padding(
                padding: const EdgeInsets.only(top: 300, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Best deals',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Extraordinary five star',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Outdoor activities',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            : AnimatedOpacity(
                duration: const Duration(milliseconds: 0),
                opacity: top >= 100 ? 1.0 : 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'best deals',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'extraordinary five_star',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'outdoor activities',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
