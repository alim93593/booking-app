// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_cast, must_be_immutable, non_constant_identifier_names, unnecessary_string_interpolations, override_on_non_overriding_member, avoid_print


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel(
      {
        required this.title,
        required this.body,
        required this.image
      }
      );
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  List<BoardingModel> boarding =[
    BoardingModel(title: 'Booking App', body: 'Find Your Perfect Somewhere', image: 'assets/on_boarding/image_1.json'),
    BoardingModel(title: 'Booking App', body: 'Earn Rewards For Each Night Away', image: 'assets/on_boarding/image_2.json'),
    BoardingModel(title: 'Booking App', body: 'Plan a stay the Family will Love', image: 'assets/on_boarding/image_3.json'),
  ];
  bool isLast = false;
  int currentPage = 0;
  Timer? timer;
  var boardingController = PageController();
  void onsubmit(){
    // CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    //   print(value);
    //   if(value!=null){
    //     navigateandfinish(context, ShopLoginScreen());
    //   }
    // });
  }
  @override
  void initState() {
    super.initState();
     Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      boardingController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
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
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   actions: [
      //     defaultTextButton(
      //         text: 'Skip',
      //         function: (){
      //           onsubmit();
      //         }
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (int index){
                  if(index == boarding.length-1){
                    setState(() {
                      isLast = true;
                      print(' last');
                    });
                  }else{
                    setState(() {
                      isLast=false;
                      print('not last');
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildboardingItem(boarding[index]),
                itemCount: 3,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect:ExpandingDotsEffect(
                      dotColor: Colors.blue,
                      activeDotColor: Colors.blue,
                      dotHeight: 10,
                      dotWidth: 10.0,
                      spacing: 5.0,
                      expansionFactor: 4.0
                  ) ,
                ),
                SizedBox(width: 5,),
                // Text(
                //   '${boardingController.page!.round()+1}' ,
                //   style: TextStyle(fontSize: 18.0,color: Colors.blue,fontWeight: FontWeight.bold),
                // ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast){
                      onsubmit();
                    }else{
                      boardingController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildboardingItem(BoardingModel Model ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child:Lottie.asset('${Model.image}')
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${Model.title}',
        style: TextStyle(
          fontSize: 24.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${Model.body}',
        style: TextStyle(
          fontSize: 18.0,
          // fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 30.0,
      ),

      // PageView.builder(itemBuilder: (context,index)=>)
    ],
  );
}
