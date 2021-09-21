import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pharma_guide/Guest/ApiGuest/pharmacyModel.dart';
import 'package:pharma_guide/provider/location_provider.dart';
import 'package:provider/provider.dart';
import 'directions_model.dart';
import 'directions_repository.dart';

class MapView extends StatefulWidget {
  Pharmacy pharmacy;
  LatLng latLng;
  bool p=false;

  MapView(this.pharmacy,this.latLng);

  @override
  _MapViewState createState() => _MapViewState(this.pharmacy,this.latLng);
}

class _MapViewState extends State<MapView> {
  final Pharmacy _pharmacy;
  final LatLng _latLng;
  _MapViewState(this._pharmacy,this._latLng);


  GoogleMapController _googleMapController;
  double Ilat;
  double Ilng;
  Marker _origin;
  Marker _destination;
  Directions _info;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;


  @override
  void initState() {
    Ilat=_latLng.latitude;
    Ilng=_latLng.longitude;
    _destination = Marker(
      markerId: const MarkerId('destination'),
      infoWindow: const InfoWindow(title: 'Pharmacy'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(_pharmacy.latitude, _pharmacy.longtude),
    );
    _origin = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'CurrentLocation'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(Ilat, Ilng),
    );
    getDir();
    //Provider.of<LocationProvider>(context,listen: false).initialization();
  }
  // static const _initialCameraPosition = CameraPosition(
  //   target: LatLng(Ilat, ),
  //   zoom: 11.5,
  // );
  bool p=false;
  @override
  void dispose() {
    _googleMapController.dispose();
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }
  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/images/point.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 2,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_googleMapController != null) {
          _googleMapController.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 100.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 5,
              zoom: 100)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }
  void getDir() async {
    final directions = await DirectionsRepository().getDirections(
        origin: _origin.position, destination: _destination.position);
    setState(() => _info = directions
    );
    _googleMapController.animateCamera(CameraUpdate.newLatLngBounds(_info.bounds, 100));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: (h * (2 / 3)) ,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(Ilat,Ilng),
                        zoom: 11.5,
                      ),
                      onMapCreated: (controller) =>
                          _googleMapController = controller,
                      markers: {_origin, _destination},
                      polylines: {
                        if (_info != null)
                          Polyline(
                            polylineId: const PolylineId('overview_polyline'),
                            color: Colors.red,
                            width: 5,
                            points: _info.polylinePoints
                                .map((e) => LatLng(e.latitude, e.longitude))
                                .toList(),
                          ),
                      },
                    ),
                    if (_info != null)
                      Positioned(
                        top: 30.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
                          child: Text(
                            '${_info.totalDistance} , ${_info.totalDuration}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                )),
            Card(
              borderOnForeground: true,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 0.5, color: Colors.black.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${_pharmacy.pharmName}',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSansR',
                            color: Color(0xFFc31432)),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Address: ',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSansR',
                              color: Color(0xFF240b36)),
                        ),
                        Text(
                          '${_pharmacy.adress}',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSansR',
                              color: Color(0xFFc31432)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${_pharmacy.userPhone}',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'OpenSans2',
                            color: Color(0xFF240b36)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${_pharmacy.userName}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  alignment: Alignment.center,
                  child: FlatButton(
                      onPressed: (){

                            _googleMapController.animateCamera(
                               CameraUpdate.newCameraPosition(CameraPosition(
                                target: LatLng(Ilat,Ilng ),
                                zoom: 11.5,
                              )),
                            );
                        getCurrentLocation();
                       //      LocationProvider l;
                       //      l.initialization();
                         if(p==false){
                           setState(() {
                             p=true;
                           });
                         }else{
                           setState(() {
                             p=false;
                           });
                         }
                        },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "START",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
            Text(
              "Click to Start Directions ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
