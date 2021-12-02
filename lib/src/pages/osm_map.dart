import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:markets/src/elements/RecapCard.dart';

class OsmMap extends StatefulWidget {

  _OsmMapState createState() => _OsmMapState();
}

class _OsmMapState extends State<OsmMap> {

  MapController controller;
  @override
  void initState() {
    controller = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void bouton_sheet() {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        height: 400,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pickup", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ListTile(
              leading: CircleAvatar(
                child: Image.asset("assets/img/photo_profil.png"),
              ),
              title: Text("Talom Patrick"),
              subtitle: Text("BD5678GG"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.phone, size: 20, color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.message, size: 20, color: Colors.white,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            RecapCard(
              icon: Icons.circle,
              color: Colors.indigo,
              name: "Nna Nonga tresor",
              number: "+237 654871038",
              address: "GP Melen, Yaoundé",
            ),
            SizedBox(height: 8),
            RecapCard(
              icon: Icons.circle,
              color: Colors.green,
              name: "Donang Arold",
              number: "+237 695227936",
              address: "Carrefour Jouvence, Yaoundé",
            ),
            SizedBox(height: 15,),
          ],
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: controller.drawRoad( GeoPoint(latitude: 47.4358055, longitude: 8.4737324),GeoPoint(latitude: 47.4371, longitude: 8.6136)),
      builder: (context, snapshot) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
        onPressed: () async{
          bouton_sheet();
          //change location
          /*
          GeoPoint geoPoint = await controller.selectPosition();
          controller.changeLocation(geoPoint);*/
          //List<SearchInfo> suggestions = await addressSuggestion("address");//search suggestion
          RoadInfo roadInfo = await controller.drawRoad( GeoPoint(latitude: 47.35387, longitude: 8.43609),GeoPoint(latitude: 47.4371, longitude: 8.6136));
          print("${roadInfo.distance}km");
          print("${roadInfo.duration}sec");
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
          /*appBar: AppBar(
        centerTitle: true,
        title: Text("OSM Map"),
        actions: [
          IconButton(icon: Icon(Icons.ac_unit),onPressed: () async {
            await controller.drawRect(RectOSM(
              key: "rect",
              centerPoint: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
              distance: 1200.0,
              color: Colors.red,
              strokeWidth: 0.3,
            ));
          },),
          IconButton(icon: Icon(Icons.access_time_filled,), onPressed: () async {
            await controller.removeRect("rect");
          },)
        ],
      ),*/
          body: OSMFlutter(
            controller: controller,
            isPicker: true,
            useSecureURL: true,
            showZoomController: true,
            showDefaultInfoWindow: true,
            road: Road(
              startIcon: MarkerIcon(
                icon: Icon(
                  Icons.circle,
                  size: 120,
                  color: Colors.green,
                ),
              ),
              middleIcon: MarkerIcon(
                icon: Icon(
                  Icons.circle,
                  size: 120,
                  color: Colors.indigo,
                ),
              ),
              endIcon: MarkerIcon(
                icon: Icon(
                  Icons.circle,
                  size: 120,
                  color: Colors.yellow,
                ),
              ),
              roadColor: Colors.green,
            ),
            /*markerIcon: MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 120,
              ),
            ),*/
          ),
        );
      },
    );
  }
}