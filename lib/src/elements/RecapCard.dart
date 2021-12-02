import 'package:flutter/material.dart';

class RecapCard extends StatelessWidget {
  String name;
  String number;
  String address;
  IconData icon;
  Color color;
  RecapCard({this.name, this.number, this.address, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child:  Icon(icon, color: color,),
            )
          ),
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                      Text(' | '),
                      Text(number,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                  Text(address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                ]
            ),
          )
        ]
      )
    );
  }
}