import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:quickpark/widget/BottomSheet.dart';

import 'home.dart';

class MapView extends StatefulWidget{

  @override
  State createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text("Map View",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20,
        color: Colors.black54)),),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: (){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(0.6),
              size: 20,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade200,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(initialCameraPosition:  CameraPosition(
              target: LatLng(18.5007,73.8584),
              zoom: 12,
            ),
              myLocationEnabled: true,
              markers: Set.from([
                Marker(

                  markerId: MarkerId('source'),
                  position: LatLng(18.5007,73.8584),
                  infoWindow: InfoWindow(title: 'Swargate'),
                  onTap: (){
                    _showBottomSheet();
                  }
                ),
                Marker(markerId: MarkerId("destination"),
                position: LatLng(18.5196,73.8553 ),
                  infoWindow: InfoWindow(title: "Shivaji Nagar"),
                  onTap: (){
                  _showBottomSheet();
                  }
                ),
                Marker(
                    markerId: MarkerId("destination"),
                    position: LatLng(18.4537, 73.8563),
                    infoWindow: InfoWindow(title: "Katraj"),
                  onTap: (){
                      _showBottomSheet();
                  }
                ),
                Marker(
                    markerId: MarkerId("destination"),
                    position: LatLng(18.618008, 73.819116),
                    infoWindow: InfoWindow(title: "Vallabhnagar"),
                  onTap: (){
                      _showBottomSheet();
                  }
                ),
                Marker(
                  markerId: MarkerId('destination'),
                  position: LatLng(18.5039,73.8077),
                  infoWindow: InfoWindow(title: 'Kothrud'),
                  onTap: (){
                    _showBottomSheet();
                  }
                ),

              ]

              ),
            ),

     /*     FlutterMap(

              //mapController: MapController,
              options:  MapOptions(
                  center: LatLng(18.5196,73.8553) ,//Coep
                  minZoom: 13.5,
                  maxZoom: 14.5,
                  zoom: 14.0),
                children:[


                TileLayer(
                    urlTemplate:
                    "http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                    subdomains:['mt0','mt1','mt2','mt3']
                ),
                MarkerLayer(
                  markers: [
                    Marker(

                        point: LatLng(18.5007,73.8584),//Swargate
                        builder: (context) {
                          return GestureDetector(
                              onTap: (){
                                _showBottomSheet();
                              },
                              child: MeMarker()
                          );
                        }
                    ),
                    Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(18.5196,73.8553),
                        builder: (context) {
                          return GestureDetector(
                              onTap: (){
                                _showBottomSheet();
                              },
                              child: MeMarker()
                          );
                        }
                    ),
                    Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(18.6167,73.8),
                        builder: (context) {
                          return GestureDetector(
                              onTap: (){
                                _showBottomSheet();
                              },
                              child: MeMarker()
                          );
                        }
                    ),
                    Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(18.4537,73.8563),
                        builder: (context) {
                          return GestureDetector(
                              onTap: (){
                                _showBottomSheet();
                              },
                              child: MeMarker()
                          );
                        }
                    ),
                    Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(18.5039,73.8077),
                        builder: (context) {
                          return GestureDetector(
                              onTap: (){
                                _showBottomSheet();
                              },
                              child: MeMarker()
                          );
                        }
                    )
                  ],
                ),
                    ]
            ),*/
          /*  Padding(
              padding: const EdgeInsets.only(left: 28,top: 100,right: 28,bottom: 10),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    title: TextField(
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Where do you go?',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                              letterSpacing: 0.2
                          )
                      ),
                    ),
                    trailing: Icon(
                      Icons.search,
                      size: 27,
                      color: Colors.orange[400],
                    ),
                  ),
                ),
              ),
            ),*/
            Visibility(
                visible: _visibility,
                child: DraggableSheet()
            ),
          ],
        ),
      ),
    );
  }

  bool _visibility = false;
  _showBottomSheet(){
    setState(() {
      _visibility = _visibility ? false : true;
    });
  }
}