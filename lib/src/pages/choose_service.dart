import 'package:flutter/material.dart';

class ChooseServicesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Center(
                child: Text("Choose a service", style: TextStyle(fontSize: 22, color: Colors.black),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 10,
                        height: 126,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.delivery_dining, size: 40, color: Colors.greenAccent,),
                              SizedBox(height: 16),
                              Text("pickup & Delivery", style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.greenAccent
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 10,
                        height: 126,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_cart, size: 40, color: Colors.greenAccent,),
                              SizedBox(height: 16,),
                              Text("Shop", style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.greenAccent
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 10,
                        height: 126,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.medical_services_sharp, size: 40, color: Colors.greenAccent,),
                              SizedBox(height: 16,),
                              Text("Pharmarcy", style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.greenAccent
                              ),)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 10,
                        height: 126,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.airport_shuttle_outlined, size: 40, color: Colors.greenAccent,),
                              SizedBox(height: 16,),
                              Text("Logistic", style: TextStyle(
                                fontFamily: "Manrope-ExtraLight",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.greenAccent,
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 10,
                        height: 126,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.fastfood_rounded, size: 40, color: Colors.greenAccent,),
                              SizedBox(height: 16,),
                              Text("Food Delivery", style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.greenAccent
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 10,
                        height: 126,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.adjust_rounded, size: 40, color: Colors.greenAccent,),
                              SizedBox(height: 16,),
                              Text("Beauty", style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.greenAccent
                              ),)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )
      )
    );
  }
}