import 'dart:async';

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/core/widget/main_button.dart';
import 'package:booking_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/features/auth/presentation/screens/register_screen/register_screen.dart';
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
        title: 'Plan your trips',
        body: 'Book one of our unique hotels to escape the ordinary',
        image: 'assets/on_boarding/image_1.png'),
    BoardingModel(
        title: 'Find best deals',
        body: 'Find deals for any season from cosy country homes to city flats',
        image: 'assets/on_boarding/image_2.png'),
    BoardingModel(
        title: 'Booking App',
        body: 'Find deals for any season from cosy country homes to city flats',
        image: 'assets/on_boarding/image_3.png'),
  ];
  bool isLast = false;
  int currentPage = 0;
  Timer? timer;
  var boardingController = PageController();

  void onSubmit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
  if(boardingController.hasClients) {
    boardingController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
    }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 500.0,
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
              height: 32.0,
            ),
            CustomPageIndicator(
              controller: boardingController,
            ),
            const SizedBox(
              height: 32.0,
            ),
            MainButton(
              width: 300.0,
              height: 50.0,
              onTabbed: () {
                onSubmit();
                navigateTo(context: context, route: const LoginScreen());
              },
              myStyle: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              myColor: mainColor,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25.0,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              child: MainButton(
                width: 300.0,
                height: 50.0,
                onTabbed: () {
                  navigateTo(
                    context: context,
                    route: const RegisterScreen(),
                  );
                },
                myStyle: const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                myColor: Colors.white.withOpacity(
                  0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
