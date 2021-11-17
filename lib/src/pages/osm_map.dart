import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          GeoPoint geoPoint = await controller.selectPosition();
          controller.changeLocation(geoPoint);
          /*List<SearchInfo> suggestions = await addressSuggestion("address");
          RoadInfo roadInfo = await controller.drawRoad( GeoPoint(latitude: 47.35387, longitude: 8.43609),GeoPoint(latitude: 47.4371, longitude: 8.6136));
          print("${roadInfo.distance}km");
          print("${roadInfo.duration}sec");*/
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
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
      ),
      body: OSMFlutter(
        controller: controller,
        isPicker: true,
        useSecureURL: true,
        showZoomController: true,
        showDefaultInfoWindow: true,
        road: Road(
          startIcon: MarkerIcon(
            icon: Icon(
              Icons.person,
              size: 120,
              color: Colors.green,
            ),
          ),
          middleIcon: MarkerIcon(
            icon: Icon(
              Icons.person,
              size: 120,
              color: Colors.indigo,
            ),
          ),
          endIcon: MarkerIcon(
            icon: Icon(
              Icons.person,
              size: 120,
              color: Colors.yellow,
            ),
          ),
          roadColor: Colors.green,
        ),
        markerIcon: MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.blue,
            size: 120,
          ),
        ),
      ),
    );
  }
}