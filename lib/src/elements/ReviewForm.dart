import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markets/src/elements/RecapCard.dart';

class ReviewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shipper",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Helvetica',
            ),
          ),
          SizedBox(height: 13),
          RecapCard(
            icon: Icons.circle,
            color: Colors.indigo,
            name: "Nna Nonga tresor",
            number: "+237 654871038",
            address: "GP Melen, Yaoundé",
          ),
          SizedBox(height: 27,),
          Text(
            "Recipient",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Helvetica',
            ),
          ),
          SizedBox(height: 13),
          RecapCard(
            icon: Icons.circle,
            color: Colors.green,
            name: "Donang Arold",
            number: "+237 695227936",
            address: "Carrefour Jouvence, Yaoundé",
          ),
          SizedBox(height: 27,),
          Text(
            "Package Information",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Helvetica',
            ),
          ),
          SizedBox(height: 13),
          Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF707070),
                  width: 0.15,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                  children: [
                    Container(
                        width: 60,
                        child: Center(
                          child:  Icon(CupertinoIcons.cube_box_fill, color: Colors.green,),
                        )
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drugs (150 Kg)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                            Text("Please be Aware. thx",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                          ]
                      ),
                    )
                  ]
              )
          ),
          SizedBox(height: 27,),
          Text(
            "Truck Information",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Helvetica',
            ),
          ),
          SizedBox(height: 13),
          Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF707070),
                  width: 0.15,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                  children: [
                    Container(
                        width: 60,
                        child: Center(
                          child:  Icon(Icons.airport_shuttle_outlined, color: Colors.green,),
                        )
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanker Truck",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                            Text("03 trucks",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                          ]
                      ),
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}