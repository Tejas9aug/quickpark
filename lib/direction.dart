import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:quickpark/helper/constants.dart';
import 'package:quickpark/main.dart';
import 'package:http/http.dart'as http;
/*class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  final Completer<GoogleMapController> _controller = Completer();

  LatLng sourceLocation = LatLng(18.5007,73.8584);
  LatLng destination = LatLng(18.5039,73.8077);
  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;
  BitmapDescriptor sourceIcon=BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon=BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon=BitmapDescriptor.defaultMarker;
  void getcurrentLocation()async{

    
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation=location;
    });
    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition

        (zoom: 13.5,
          target:
      LatLng(newLoc.latitude!, newLoc.longitude!))));
      print(currentLocation);
      setState(() {

      });
    });
  }

  void getpolypoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result =  await polylinePoints.getRouteBetweenCoordinates(api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude) ,
      PointLatLng(destination.latitude, destination.longitude)
    );
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point)=> polylineCoordinates.add(LatLng(point.latitude, point.longitude)
      )
      );
      setState(() {

      });
    }

  }
  void setCustomMakerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/destination.jpeg").then((icon) {
      sourceIcon=icon;
    });

    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/destination.jpeg").then((icon) {
      destinationIcon=icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/currentlocation.jpeg").then((icon) {
      currentLocationIcon=icon;
    });
  }

  @override
  void initState() {

    getcurrentLocation();
    setCustomMakerIcon();
    getpolypoints();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Direction"),
      elevation: 0.0,),
      body: currentLocation == null
         ?const Center(child: CircularProgressIndicator(),)
      :GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(
          currentLocation!.latitude!, currentLocation!.longitude!),zoom: 14.5

      ),
        polylines: {
        Polyline(
          polylineId:PolylineId("route"),
        points: polylineCoordinates,
          color: Colors.blue,
          width: 4,
        )},

        markers:{
          Marker(markerId:  MarkerId("currentLocation"),
            icon: currentLocationIcon,
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
         Marker(markerId:  MarkerId("source"),
        icon: destinationIcon,
        position: sourceLocation,
        ),
          Marker(markerId:  MarkerId("destination"),
            icon: destinationIcon,
            position: destination,
          ),
        },
        onMapCreated: (mapController){
        _controller.complete(mapController);
    },
      ),
    );
  }
}
*/
/*class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  LatLng sourceLocation = LatLng(18.5007,73.8584);
  LatLng destination = LatLng(18.5039,73.8077);
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Position? _currentPosition;
  String? _currentAddress;
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  //Function for get Latitude and Longitude

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
        //desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(position.latitude);
        print(position.longitude);
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }
//  Function for location from your latitude and longitude

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.subLocality}";//here you can used place.country and other things also
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }
  /*Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
       // desiredAccuracy:LocationAccuracy.high
    );
    double lat = position.latitude;
    double long = position.longitude;
    print("Latitude: $lat and Longitude: $long");
  }*/

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.5007,73.8584),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(18.5039,73.8077),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);



  @override
  Widget build(BuildContext context) {
    return/* Column(
      children: [
        if (_currentPosition != null && _currentAddress != null)
          Text(
            _currentAddress!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
      ],
    );*/
    /*  Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers:{
       /*   Marker(markerId:  MarkerId("currentLocation"),
            //icon: Icon(Icons.location_city),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),*/
          Marker(markerId:  MarkerId("source"),
           // icon: destinationIcon,
            position: sourceLocation,
            infoWindow: InfoWindow(title: "Swargate")
          ),
          Marker(markerId:  MarkerId("destination"),
           // icon: destinationIcon,
            position: destination,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the Destination!'),
        icon: const Icon(Icons.location_city),
      ),
    );*/
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
*/
/*class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  _MapSample createState() => _MapSample();
}

class _MapSample extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(18.5039,73.8077),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(18.5007,73.8584),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        // on below line we have given title of app
        title: Text("MAp"),
      ),
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
            mapType: MapType.hybrid,
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            //mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());

            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );

            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}*/
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
   //Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> _polylines = {};
  /*LatLng sourceLocation = LatLng(18.5007,73.8584);
  LatLng destination = LatLng(18.5039,73.8077);
    Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Position? _currentPosition;
  String? _currentAddress;
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }*/
  //LocationData? currentLocation;
  /*void getcurrentLocation()async{


    Location location = Location();
    location.getLocation().then((location) {
      currentLocation=location;
    });
    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition

        (zoom: 13.5,
          target:
          LatLng(newLoc.latitude!, newLoc.longitude!))));
      print(currentLocation);
      setState(() {

      });
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Directions",style: TextStyle(color: Colors.black),

      ),
      elevation: 0.0,
      backgroundColor: Colors.blue.shade200,

      ),
      body: GoogleMap(

        mapType: MapType.normal,
        myLocationEnabled: true,

        initialCameraPosition: CameraPosition(
          target: LatLng(18.5007,73.8584),
          zoom: 12,
        ),
        markers: Set.from([
          Marker(

            markerId: MarkerId('source'),
            position: LatLng(18.5007,73.8584),
            infoWindow: InfoWindow(title: 'Swargate'),
          ),
          Marker(
            markerId: MarkerId('destination'),
            position: LatLng(18.5039,73.8077),
            infoWindow: InfoWindow(title: 'Kothrud'),
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: LatLng(18.5196, 73.8553),
            infoWindow: InfoWindow(title: "Shivaji Nagar")
          ),
          Marker(
              markerId: MarkerId("destination"),
              position: LatLng(18.4537, 73.8563),
              infoWindow: InfoWindow(title: "Katraj")
          ),
          Marker(
              markerId: MarkerId("destination"),
              position: LatLng(18.618008, 73.819116),
              infoWindow: InfoWindow(title: "Vallabhnagar")
          ),

        ]),
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller ;
        },
      ),
     /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getDirections();
        },
        child: Icon(Icons.directions),
      ),*/


    );
  }

  Future<void> _getDirections() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json'
            '?origin=${37.7749},${-122.4194}'
            '&destination=${37.3352},${-121.8811}'
            '&key=AIzaSyCeCgxLq8nGY0rOX9n4lhITMYAJ4g4AMC4'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final points = PolylinePoints().decodePolyline(
          data['routes'][0]['overview_polyline']['points']);
      if (points.isNotEmpty) {
        final List<LatLng> latLngs = points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
        setState(() {
          _polylines.add(Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            width: 5,
            points: latLngs,
          ));
        });
      } else {
        print('No points found');
      }
    } else {
      throw Exception('Failed to load directions');
    }
  }


}
/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:polyline/polyline.dart' as Polyline;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  Set<Polyline> _polylines = {};

  static const LatLng _origin = LatLng(37.7749, -122.4194);
  static const LatLng _destination = LatLng(37.3352, -121.8811);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _origin,
          zoom: 12,
        ),
        onMapCreated: (controller) => _mapController = controller,
        polylines: _polylines,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDirections,
        child: Icon(Icons.directions),
      ),
    );
  }

  Future<void> _getDirections() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json'
            '?origin=${_origin.latitude},${_origin.longitude}'
            '&destination=${_destination.latitude},${_destination.longitude}'
            '&key=YOUR_API_KEY'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
    //  final points = Polyline.Polyline.Decode(
       //   encodedString: data['routes'][0]['overview_polyline']['points'])
        //  .decodedCoords;
      final points = PolylinePoints().decodePolyline(data['routes'][0]['overview_polyline']['points']);
      if (points.isNotEmpty) {
        final List<LatLng> latLngs =
        points.map((point) => LatLng(point[0], point[1])).toList();
        setState(() {
          _polylines.add(Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            width: 5,
            points: latLngs,
          ));
        });
        final bounds = LatLngBounds(
          southwest: LatLng(
            data['routes'][0]['bounds']['southwest']['lat'],
            data['routes'][0]['bounds']['southwest']['lng'],
          ),
          northeast: LatLng(
            data['routes'][0]['bounds']['northeast']['lat'],
            data['routes'][0]['bounds']['northeast']['lng'],
          ),
        );
        _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
      } else {
        print('No points found');
      }
    } else {
      throw Exception('Failed to load directions');
    }
  }
}
*/