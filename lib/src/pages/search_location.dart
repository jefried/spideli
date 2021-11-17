import 'package:flutter/material.dart';
import 'package:markets/address_search.dart';
import 'package:uuid/uuid.dart';

import '../../place_service.dart';

class SearchLocation extends StatefulWidget {

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  final _destinationController = TextEditingController();

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  _search() async {
    final sessionToken = Uuid().v4();
    final Suggestion result = await showSearch(
      context: context,
      delegate: AddressSearch(sessionToken)
    );
    if(result != null) {
      setState(() {
        _destinationController.text = result.description;
      });
    }
  }

 @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       title: Text("Enter destination", style: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold)),
       backgroundColor: Colors.white,
       leading: IconButton(
         icon: Icon(Icons.arrow_back, color: Colors.black,),
         onPressed: () {},
       ),
       bottom: PreferredSize(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
           child: Column(
             children: [
               AddressInput(
                 iconData: Icons.gps_fixed,
                 hintText: "Punto de partida",
                 enabled: false,
               ),
               SizedBox(height: 10.0,),
               Row(
                 children: [
                   AddressInput(
                     controller: _destinationController,
                     iconData: Icons.place_sharp,
                     hintText: " dddddddddddd",
                     onTap: _search,
                   ),
                   InkWell(
                     child: Icon(
                       Icons.add,
                       color: Colors.black,
                       size: 28,

                     ),
                   )
                 ],
               )
             ],
           ),
         ),
         preferredSize: Size.fromHeight(70),
       ),
     ),
   );
  }
}

class AddressInput extends StatelessWidget {
  final IconData iconData;
  final TextEditingController controller;
  final String hintText;
  final Function onTap;
  final bool enabled;

  const AddressInput({
    Key key,
    this.iconData,
    this.controller,
    this.hintText,
    this.onTap,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          this.iconData,
          size: 18,
            color: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 35.0,
            width: MediaQuery.of(context).size.width / 1.4,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[100],
            ),
            child: TextField(
              controller: controller,
              onTap: onTap,
              enabled: enabled,
              decoration: InputDecoration.collapsed(hintText: hintText),
            ),
          ),
        )
      ],
    );
  }

}