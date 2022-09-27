// ignore_for_file: use_key_in_widget_constructors, prefer_const_declarations, unused_element, empty_catches, prefer_final_fields, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unused_local_variable

import 'dart:async';
import 'dart:ui';

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'hotel_room_list.dart';

class HotelDetails extends StatefulWidget {
  final dynamic hotelName;
  final dynamic description;
  final dynamic address;
  final dynamic price;
  final dynamic rate;

  HotelDetails(
      {required this.hotelName,
      required this.description,
      required this.address,
      required this.price,
      required this.rate});

  // HotelListData hotelListData = HotelListData();
  static const String routeName = 'home-details';

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails>
    with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  var hotelText =
      'Featuring a fitness center , Grand royal parking hotel is located in egypt , 4.7 km from giza ...';
  var hotelText2 =
      'Featuring a fitness center , Grand royal parking hotel is located in egypt , 4.7 km from giza a fitness center ';
  bool isFav = false;
  bool isReadless = false;

  late AnimationController animationController;
  var imageHeight = 0.0;

  late AnimationController _animationController;

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    animationController.forward();
    scrollController.addListener(() {
      if (mounted) {
        if (scrollController.offset < 0) {
          //we static set the just below half scrolling values
          _animationController.animateTo(0.0);
        } else if (scrollController.offset > 0.0 &&
            scrollController.offset < imageHeight) {
          //we need around half scrolling values
          if (scrollController.offset < ((imageHeight / 1.2))) {
            _animationController
                .animateTo(scrollController.offset / imageHeight);
          } else {
            //we static set the just above half scrolling values "around == 0.22"
            _animationController.animateTo((imageHeight / 1.2) / imageHeight);
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    var cardColor = ModeCubit.get(context).isDark == true
        ?  const Color(0xff212525)
        : const Color(0xffffffff);
    imageHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.only(top: 24 + imageHeight),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: getHotelsDetails(isInList: true),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      children:  [
                        Expanded(
                          child: Text(
                            'Summery',
                            style: TextStyle(
                                fontSize: 14,
                                color: color,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 4, bottom: 8),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: !isReadless ? hotelText : hotelText2,
                            style:  TextStyle(
                              fontSize: 12,
                              color:color,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: !isReadless ? 'read more' : '' 'less',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  isReadless = !isReadless;
                                });
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  getPhotoReviewUi(
                      'Photos', 'View All', Icons.arrow_forward, () {}),
                  const HotelRoomList(),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        padding:
                            const EdgeInsetsDirectional.only(start: 14, end: 14),
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.grey.withOpacity(0.6),
                          onPressed: () {
                            // Navigator.pushNamed(context, MapScreen.routeName);
                          },
                          label: const Text('see more'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(top: 24, bottom: 14),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.blue,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          //booking room
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /*getPhotoReviewUi(
                      'Reviews', 'View All', Icons.arrow_forward, () {
                        Navigator.pushNamed(context, ReviewsListScreen.routeName);
                  }),*/
                ],
              ),
            ),
            //background images , hotel names , their details and more animation view
            //backgroundImageUi(widget.hotelListData ?? HotelListData()),
            backgroundImageUi('assets/images/back.jpg'),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                height: AppBar().preferredSize.height,
                child: Row(
                  children: [
                    _getAppBarUi(Theme.of(context).disabledColor.withOpacity(0.4),
                        Icons.arrow_back, Theme.of(context).backgroundColor, () {
                      if (scrollController.offset != 0.0) {
                        scrollController.animateTo(0.0,
                            duration: const Duration(milliseconds: 488),
                            curve: Curves.easeInOutQuad);
                      } else {
                        Navigator.pop(context);
                      }
                    }),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    /*  _getAppBarUi(
                        Colors.white,
                        isFav ? Icons.favorite : Icons.favorite_border,
                        Theme.of(context).primaryColor, () {
                      setState(() {
                        isFav = !isFav;
                      });
                    })*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getAppBarUi(
      Color color, IconData icon, Color iconColor, VoidCallback onTap) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Container(
          width: AppBar().preferredSize.height - 8,
          height: AppBar().preferredSize.height - 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(
                Radius.circular(32.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  backgroundImageUi(String image) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            var opacity = 1.0 -
                (_animationController.value >= (imageHeight / 1.2) / imageHeight
                    ? 1.0
                    : _animationController.value);
            return SizedBox(
              height: imageHeight * (1.0 - _animationController.value),
              child: Stack(
                children: [
                  IgnorePointer(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: opacity,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .27,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  color: Colors.black54.withOpacity(0.6),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16),
                                        child: getHotelsDetails(),
                                      ),
                                      Center(
                                        child: Container(
                                          width: double.infinity,
                                          margin: const EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                          child: MaterialButton(
                                            onPressed: () {
                                              //go to room book screen
                                              //video 22.40 minute
                                            },
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  color: Colors.black54,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(38)),
                                      onTap: () {
                                        try {
                                          scrollController.animateTo(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                              duration: const Duration(
                                                  milliseconds: 5000),
                                              curve: Curves.fastOutSlowIn);
                                        } catch (e) {}
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'More Details',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 2),
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  getHotelsDetails({
    bool isInList = false,
  }) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.hotelName,
                textAlign: TextAlign.left,
                style: const TextStyle(
                     color: Colors.grey, fontSize: 18),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.address,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                    const Icon(
                      Icons.location_on_sharp,
                      color: Colors.blue,
                      size: 13,
                    ),
                     const Text(
                      //"${widget.hotelListData.dist.toStringAsFixed(1)}",
                      '2.0',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle( color: Colors.grey, fontSize: 11),
                    ),
                    const Text(
                      'KM To City',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              isInList
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          ///
                          //Helper.ratingStar(),
                          RatingBarIndicator(
                            rating: double.parse('${widget.rate}') / 2,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            unratedColor: Colors.grey.withOpacity(.7),
                            direction: Axis.horizontal,
                          ),
                          Text(
                            '(${double.parse('${widget.rate}') / 2})',
                            style: TextStyle(
                              fontSize: 10,
                              color: isInList
                                  ? Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.5)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${widget.price}',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isInList ? Colors.grey : Colors.white,
              ),
            ),
            Text(
              '/Per Night',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 11,
                color: isInList ? Colors.grey : Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  getPhotoReviewUi(
      String title, String view, IconData iconData, VoidCallback onTap) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style:  TextStyle(
                  color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text(
                      view,
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(
                        iconData,
                        size: 13,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
