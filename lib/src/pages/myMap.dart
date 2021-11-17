import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  LatLng point = LatLng(49.5, -0.09);
  var location = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            slideOnBoundaries: true,
            minZoom: 2.3,
            onTap: (p) async{
              location = await Geocoder.local.findAddressesFromCoordinates(Coordinates(p.latitude, p.longitude));
              setState(() {
                point = p;
              });
            },
            center: LatLng(49.5, -0.09),// will allow us to position the center of the map at a certain coordinates
            zoom: 3.0
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",// it will allow us to get the image from openstreetmap at certain points
              subdomains: ['a','b','c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 100.0,
                  height: 100.0,
                  point:
                    point,
                  builder:(ctx) => Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40.0,
                  )
                )
              ]
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    hintText: "Search for Location",
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    location.length>0? "${location.first.countryName}, ${location.first.locality}, ${location.first.featureName}":"",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}