import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';

class LocationProvider with ChangeNotifier {
  Location _location;

  Location get location => _location;
  LatLng _locationPosition;

  LatLng get locationPostion => _locationPosition;
  bool locationServiceActivate = true;

  LocationProvider() {
    _location = new Location();
  }

  initialization() async {
    await getUserLocaton();

  }

  getUserLocaton() async {
    bool _serviceEnabled;
    PermissionStatus _permationGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        return;
      }
      _permationGranted = await location.hasPermission();
      if (_permationGranted == PermissionStatus.DENIED) {
        _permationGranted = await location.requestPermission();
        if (_permationGranted != PermissionStatus.GRANTED) {
          return;
        }
      }
      location.onLocationChanged().listen((LocationData currenLocation) {
        _locationPosition =
            LatLng(currenLocation.latitude, currenLocation.longitude);
        notifyListeners();
      });
    }
  }
}
