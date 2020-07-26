import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String locationString;

  static LatLng flutterCoffee = LatLng(31.509557, 34.421466);
  Set<Marker> myMarkers = {
    Marker(
      markerId: MarkerId('flutterCoffee'),
      position: flutterCoffee,
    ),
  };
  GoogleMapController controller;

  Future<LatLng> getCurrentLocation() async {
    Geolocator geolocator = Geolocator();
    Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    LatLng myLocation = LatLng(position.latitude, position.longitude);
    AnimateCamera(myLocation);
    return myLocation;
  }

  getPlaceName(LatLng position) async {
    try {
      List<Address> addresses = await Geocoder.local
          .findAddressesFromCoordinates(
              Coordinates(position.latitude, position.longitude));
      Address first = addresses[0];

      print(first.addressLine);
    } catch (e) {
      print(e);
    }
  }

  AnimateCamera(LatLng location) {
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
//            bearing: 30,
            tilt: 40,
            target: location,
            zoom: 13.2),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) async {
          this.controller = controller;
        },
        onTap: (argument) {
          // myMarkers.clear();
          myMarkers.add(
            Marker(
              markerId: MarkerId('myLocation'),
              position: LatLng(argument.latitude, argument.longitude),
            ),
          );
          getPlaceName(argument);
          setState(() {});
        },
        markers: {
          ...?myMarkers,
        },
        initialCameraPosition: CameraPosition(
          target: flutterCoffee,
          zoom: 18.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // setState(() {});
          // markerList.clear.call();
          LatLng myLocation = await getCurrentLocation();
          myMarkers.add(
            Marker(
              markerId: MarkerId('myLocation'),
              position: LatLng(myLocation.latitude, myLocation.longitude),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// return FutureBuilder<LatLng>(
//   future: getCurrentLocation(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return GoogleMap(
//         onMapCreated: (controller) async {
//           this.controller = controller;
//           AnimateCamera(
//             flutterCoffee,
//           );
//         },
//         onTap: (argument) {
//           myMarkers.clear();
//           myMarkers.add(
//             Marker(
//               markerId: MarkerId('argument$argument'),
//               position: LatLng(argument.latitude, argument.longitude),
//             ),
//           );
//           getPlaceName(argument);
//           setState(() {});
//         },
//         markers: {
//           ...?myMarkers,
//           Marker(
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueOrange),
//             markerId: MarkerId('argument'),
//             position: LatLng(myLocation.latitude, myLocation.longitude),
//           ),
//         },
//         initialCameraPosition: CameraPosition(
//           target: myLocation,
//           zoom: 18.0,
//         ),
//       );
//     } else {
//       return Center(child: CircularProgressIndicator());
//     }
//   },
// );

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   static LatLng late = LatLng(31.5307, 34.4557);

//   String name;

//   GoogleMapController _controllerMap;
//   Set<Marker> markerList = {
//     Marker(markerId: MarkerId('Late'), position: late),
//   };

//   // getPlaceName(Position position) async {
//   //   try {
//   //     List<Address> addresses = await Geocoder.local
//   //         .findAddressesFromCoordinates(
//   //             Coordinates(position.latitude, position.longitude));
//   //     Address first = addresses.first;

//   //     print("${first.featureName} : ${first.addressLine}");
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   getPlaceName(LatLng position) async {
//     try {
//       List<Address> addresses = await Geocoder.local
//           .findAddressesFromCoordinates(
//               Coordinates(position.latitude, position.longitude));
//       Address first = addresses.first;

//       print("${first.featureName} : ${first.addressLine}");
//     } catch (e) {
//       print(e);
//     }
//   }

//   getPlaceName2(Position position) async {
//     try {
//       List<Address> addresses = await Geocoder.local
//           .findAddressesFromCoordinates(
//               Coordinates(position.latitude, position.longitude));
//       Address first = addresses.first;

//       print(" ${first.addressLine}");
//     } catch (e) {
//       print(e);
//     }
//   }

//   LatLng myLocation;
//   Future<Position> getCurrentLocation() async {
//     Geolocator geolocator = Geolocator();

//     Position position = await geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     myLocation = LatLng(position.latitude, position.longitude);
//     // markerList.add(
//     //     Marker(markerId: MarkerId('currentLocation'), position: myLocation));
//     // _controllerMap.animateCamera(
//     //   CameraUpdate.newCameraPosition(
//     //       CameraPosition(target: myLocation, zoom: 10)),
//     // );
//     await getPlaceName2(position);
//     setState(() {});

//     return position;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
// body: FutureBuilder<Position>(
//     future: getCurrentLocation(),
//     builder: (context, AsyncSnapshot asyncSnapshot) {
//       if (asyncSnapshot.hasData) {
//         Position position = asyncSnapshot.data;
//         LatLng myLocation = LatLng(position.latitude, position.longitude);
//         markerList.add(Marker(
//             markerId: MarkerId('currentLocation'), position: myLocation));

//         if (position == null) {
//           return GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               _controllerMap = controller;
//               _controllerMap.animateCamera(CameraUpdate.newCameraPosition(
//                   CameraPosition(target: myLocation, zoom: 10)));
//             },
//             mapType: MapType.hybrid,
//             markers: markerList,
//             initialCameraPosition: CameraPosition(target: late, zoom: 10),
//             onTap: (argument) {
//               setState(() {});
//               markerList.add(Marker(
//                   markerId: MarkerId('Position $late'),
//                   position:
//                       LatLng(argument.latitude, argument.longitude)));
//             },
//           );
//         } else {
//           return GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               _controllerMap = controller;
//               _controllerMap.animateCamera(CameraUpdate.newCameraPosition(
//                   CameraPosition(target: myLocation, zoom: 10)));
//             },
//             mapType: MapType.hybrid,
//             markers: markerList,
//             initialCameraPosition: CameraPosition(target: late, zoom: 10),
//             onTap: (argument) {
//               setState(() {});
//               markerList.add(Marker(
//                   infoWindow: InfoWindow(title: name),
//                   markerId: MarkerId('Position $late'),
//                   position:
//                       LatLng(argument.latitude, argument.longitude)));
//             },
//           );
//         }
//       } else {
//         return Container();
//       }
//     }),
//       body: GoogleMap(
//         zoomControlsEnabled: true,
//         onMapCreated: (controller) {
//           this._controllerMap = controller;
//         },
//         markers: {
//           ...?markerList,
//           Marker(
//             markerId: MarkerId('myLocation'),
//         position: myLocation
//           )
//         },
//         initialCameraPosition: CameraPosition(target: late, zoom: 15),
//         onTap: (argument) async {
//           // Position position = await getCurrentLocation();
//           getPlaceName(argument);
//           setState(() {});
//           markerList.add(Marker(
//               infoWindow: InfoWindow(title: 'MyLocation'),
//               markerId: MarkerId('Position $late'),
//               position: LatLng(argument.latitude, argument.longitude)));
//         },
//       ),

// );
//   }
// }
