import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';

class SearchAddress extends StatefulWidget {
  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Marker> allMarkers = [];

  setMarkers() {
    return allMarkers;
  }

  addToList() async {
    final query = 'Base Aérea de Anápolis, Anápolis';
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    setState(() {
      allMarkers.add(
        Marker(
          width: 45.0,
          height: 45.0,
          point: LatLng(
            first.coordinates.latitude,
            first.coordinates.longitude,
          ),
          builder: (context) => Container(
            child: IconButton(
                icon: Icon(Icons.location_on),
                iconSize: 50,
                color: Colors.red,
                onPressed: () {
                  print(first.featureName);
                }),
          ),
        ),
      );
    });
  }

  Future<void> addMarker() async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Add Marker',
            style: TextStyle(fontSize: 17),
          ),
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                'Add It',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                addToList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Leaflet Map'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: (){addMarker();},
        ),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-16.322520, -48.929458),
          zoom: 12,
          minZoom: 10,
          maxZoom: 18,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: setMarkers(),
          ),
        ],
      ),
    );
  }
}
