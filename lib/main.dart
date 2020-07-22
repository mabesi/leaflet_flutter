import 'package:flutter/material.dart';
import 'map01.dart';
import 'map02.dart';
import 'map03.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Leaflet Map',
//      home: Markers(),
      home: SearchAddress(),
    ));