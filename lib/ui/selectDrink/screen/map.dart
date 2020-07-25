import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  static LatLng flutterCoffee = LatLng(31.509557, 34.421466);
  Set<Marker> myMarkers = {
    Marker(
      markerId: MarkerId('flutterCoffee'),
      position: flutterCoffee,
    ),
  };
  GoogleMapController controller;

  LatLng myLocation ;
  Future<LatLng> getCurrentLocation() async {
    Geolocator geolocator = Geolocator();
    Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
     myLocation = LatLng(position.latitude, position.longitude);
  return myLocation;
  }
  AnimateCamera(LatLng location){
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: location , zoom: 15
    ),),);
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:getCurrentLocation() ,
      builder: (context, snapshot) {
        if(getCurrentLocation() !=null ){
          return GoogleMap(
            onMapCreated: (controller)async {
              this.controller =controller;
              await getCurrentLocation();
              AnimateCamera(flutterCoffee);
            },
            onTap: (argument) {
              myMarkers.add(
                Marker(
                  markerId: MarkerId('$argument'),
                  position: LatLng(argument.latitude, argument.longitude),
                ),
              );
              setState(() {});
            },
            markers: myMarkers,
            initialCameraPosition: CameraPosition(
              target: myLocation,
              zoom: 20.0,
            ),
          );
        } else{return CircularProgressIndicator();}

    },

    );

  }
}
