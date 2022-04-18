
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocationProvider extends ChangeNotifier {
  
  String _descriptionLocation = '';
  String get descriptionLocation=> _descriptionLocation;
  set descriptionLocation(String value){
      _descriptionLocation = value;
     notifyListeners();
  }

  LatLng? _locationPosition;
  LatLng get locationPosition=> _locationPosition as LatLng;
  set locationPosition(LatLng value){
      _locationPosition = value;
     notifyListeners();
  }

  void cleanMapLocationProvider(){
    _descriptionLocation = '';
    _locationPosition = null;
  }

}