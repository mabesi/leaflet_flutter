import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Markers extends StatefulWidget {
  @override
  _MarkersState createState() => _MarkersState();
}

class _MarkersState extends State<Markers> {
  List<Marker> allMarkers = [];

  setMarkers() {
    allMarkers.add(
      Marker(
        width: 45.0,
        height: 45.0,
        point: LatLng(-16.322520, -48.929458),
        builder: (context) => Container(
          child: IconButton(
              icon: Icon(Icons.location_on),
              iconSize: 50,
              color: Colors.orange,
              onPressed: () {
                print('Marker pressionado!');
              }),
        ),
      ),
    );

    allMarkers.add(
      Marker(
        width: 45.0,
        height: 45.0,
        point: LatLng(-16.312520, -48.939458),
        builder: (context) => Container(
          child: IconButton(
              icon: Icon(Icons.location_on),
              iconSize: 50,
              color: Colors.green,
              onPressed: () {
                print('Segundo marcador pressionado!');
              }),
        ),
      ),
    );

    return allMarkers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Leaflet Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-16.322520, -48.929458),
          zoom: 14,
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
