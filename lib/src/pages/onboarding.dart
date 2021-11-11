import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onBoardingWidget extends StatelessWidget {

  final pageDecoration = PageDecoration(
    titleTextStyle: PageDecoration().titleTextStyle.copyWith(color: Colors.greenAccent),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.white),
    pageColor: Colors.black.withOpacity(0.8),
    contentMargin: const EdgeInsets.all(10),
  );

  List<PageViewModel> getPages(BuildContext context) {
    return [
      PageViewModel(
        image: Image.asset("assets/img/market.png", width: 200, height: 200,),
        title: "Commodities Markets",
        body: "You can make your purchases of raw materials in different markets with the possibility of delivery.",
        decoration: pageDecoration
      ),
      PageViewModel(
          image: Image.asset("assets/img/fooddelivery.jpg", width: 200, height: 200,),
          title: "Food Delivery",
          body: "You can order your food in a restaurant and have it delivered",
          decoration: pageDecoration
      ),
      PageViewModel(
          image: Image.asset("assets/img/pickupdelivery.png", width: 200, height: 200,),
          title: "Pickup and Delivery",
          body: "Move your packages from point A to point B in the country.",
          decoration: pageDecoration
      ),
      PageViewModel(
          image: Image.asset("assets/img/logistic.jpg", width: 200, height: 200,),
          title: "Logistic",
          body: "Our partners put at your disposal means of transport (Bus, truck etc...) for your various needs of logistics",
          decoration: pageDecoration
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(shape: RoundedRectangleBorder()),
        showNextButton: false,
        pages: getPages(context),
        done: Row(
          children: [
            Text(
              "next",
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.arrow_right_alt),
          ],
        ),
        onDone: (){
          Navigator.of(context).pushNamed('/Login');
        },
      ),
    );
  }
}