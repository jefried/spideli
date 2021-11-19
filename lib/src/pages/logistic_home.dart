import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markets/src/elements/DrawerWidget.dart';

class LogisticHome extends StatefulWidget {
  const LogisticHome({Key key}) : super(key: key);

  @override
  _LogisticHomeState createState() => _LogisticHomeState();
}

class _LogisticHomeState extends State<LogisticHome> {
  CarouselSlider instance;
  CarouselSlider instance1;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double _amount = 0.0;

  @override
  Widget build(BuildContext context) {

    instance = CarouselSlider(
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: true,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/img/pub1.jpg",)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/img/pub1.jpg",)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/img/pub1.jpg",)
            ],
          ),
        ),
      ]
    );
    instance1 = CarouselSlider(
        options: CarouselOptions(
          initialPage: 0,
          autoPlay: true,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/img/pub4.jpg",)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/img/pub4.jpg",)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/img/pub4.jpg",)
              ],
            ),
          ),
        ]
    );
    return Scaffold(
      key: this.scaffoldKey,
      drawer: DrawerWidget(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              color: Theme.of(context).accentColor,
              height: 140 ,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 57,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Spideli Transport",
                  style: TextStyle(
                      fontFamily: "Manrope-ExtraLight",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            child: IconButton(
              icon: new Icon(Icons.sort, color: Colors.white),
              onPressed: () => this.scaffoldKey.currentState.openDrawer(),
            ),
          ),
          Positioned(
            top: 45,
            right: 5,
            child: IconButton(
              icon: new Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 110,
            child: Container(
              height: MediaQuery.of(context).size.height-110,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)
                  )
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: const Text (
                          "What are you looking for today ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Manrope-ExtraLight",
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed('/CreateLogistic');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/4,
                              height: 150,
                              child: Column(
                                children: [
                                  Image.asset("assets/img/truck.jpg", height: 100,),
                                  SizedBox(height: 3,),
                                  const Center(
                                    child: Text(
                                      "Logistic",
                                      style: TextStyle(
                                        fontFamily: "Manrope-ExtraLight",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: MediaQuery.of(context).size.width/4,
                              height: 150,
                              child: Column(
                                children: [
                                  Image.asset("assets/img/mailing.jpg", height: 100,),
                                  SizedBox(height: 3,),
                                  const Center(
                                    child: Text(
                                      "Mailing",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: "Manrope-ExtraLight",
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed('/TrackLogistic');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/4,
                              height: 150,
                              child: Column(
                                children: [
                                  Image.asset("assets/img/tracking3.jpg", height: 100,),
                                  SizedBox(height: 3,),
                                  const Center(
                                    child: Text(
                                      "Tracking",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: "Manrope-ExtraLight",
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text (
                              "Promo's Today",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Manrope-ExtraLight'
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      instance,
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text (
                              "Explore Spideli Transport",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Manrope-ExtraLight'
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      instance1,
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
