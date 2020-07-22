import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class LeafletMap extends StatefulWidget {
  @override
  _LeafletMapState createState() => _LeafletMapState();
}

class _LeafletMapState extends State<LeafletMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Leaflet Map')),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-16.322520, -48.929458),
          zoom: 15,
          minZoom: 10,
          maxZoom: 18,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(-16.322520, -48.929458),
                builder: (context) => Container(
                  child: IconButton(
                      icon: Icon(Icons.location_on),
                      iconSize: 50,
                      color: Colors.green,
                      onPressed: () {
                        print('Marker pressionado!');
                      }
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
