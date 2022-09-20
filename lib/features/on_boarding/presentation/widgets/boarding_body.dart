import 'dart:async';
import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/features/on_boarding/data/models/boarding_model.dart';
import 'package:booking_app/features/on_boarding/presentation/widgets/build_boarding_item.dart';
import 'package:booking_app/features/on_boarding/presentation/widgets/custom_page_indicator.dart';
import 'package:flutter/material.dart';

class BoardingBody extends StatefulWidget {
  const BoardingBody({Key? key}) : super(key: key);

  @override
  State<BoardingBody> createState() => _BoardingBodyState();
}

class _BoardingBodyState extends State<BoardingBody> {
  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'Booking App',
        body: 'Find Your Perfect Somewhere',
        image: 'assets/on_boarding/image_1.png'),
    BoardingModel(
        title: 'Booking App',
        body: 'Earn Rewards For Each Night Away',
        image: 'assets/on_boarding/image_2.png'),
    BoardingModel(
        title: 'Booking App',
        body: 'Plan a stay the Family will Love',
        image: 'assets/on_boarding/image_3.png'),
  ];
  bool isLast = false;
  int currentPage = 0;
  Timer? timer;
  var boardingController = PageController();

  void onSubmit() {
    // CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {

    //   if(value!=null){
    //     navigateAndFinish(context, ShopLoginScreen());
    //   }
    // });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentPage <= 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      boardingController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardingController,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  BuildBoardingItem(model: boarding[index]),
              itemCount: 3,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              CustomPageIndicator(
                controller: boardingController,
              ),
              const SizedBox(
                width: 5,
              ),
              const Spacer(),
              FloatingActionButton(
                backgroundColor: mainColor,
                onPressed: () {
                  if (isLast) {
                    onSubmit();
                  } else {
                    boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,);
                  }
                },
                child: const Icon(Icons.arrow_forward_ios_sharp,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
