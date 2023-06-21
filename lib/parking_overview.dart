import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quickpark/helper/constants.dart';
import 'package:quickpark/map.dart';
import 'package:quickpark/park_block.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ParkingOverview extends StatefulWidget {
  const ParkingOverview({Key? key}) : super(key: key);

  @override
  _ParkingOverviewState createState() => _ParkingOverviewState();
}

class _ParkingOverviewState extends State<ParkingOverview> {
void _showdialog(  ){
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text("Alert"),
    content: Text("Blue one are filled"
        "& remaining are empty"),
    actions: [
      TextButton(onPressed: (){Navigator.of(context).pop();
        },
          child: Text("Ok"))
    ],
  ));
}

  @override
void initState() {
 // _Alertdialogs();
   // _showdialog();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: ()  {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MapView()));
            })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Parking Overview',
          style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 6.0,
          ),
          Row(
            children: [
              Flexible(
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: klightYellow,
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 6.0),
                    child: const Text(
                      "Sedan &"
                          " Hatchback",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: klightYellow,
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 6.0),
                    child: const Text(
                      'SUV & '
                          'Two Wheeler',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
             // color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      //color: Colors.red,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                             // color: Colors.red.shade900,
                              //blocks A
                              child: Column(
                                children: [
                                  ParkBlock(
                               color: Colors.white,
                                    number: '1', onColorChanged: (color) { Colors.black54; },
                                  ),
                                  ParkBlock(
                                   color: Colors.blue,
                                    number: '2',
                                    onColorChanged: (color) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '3', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.blue,
                                    number: '4', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '5', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '6', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '7', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.white,
                                    number: '8', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.white,
                                    number: '9', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.white,
                                    number: '10', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(

                                   color: Colors.white,
                                    number: '11', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(

                                   color: Colors.white,
                                    number: '12', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(

                                    color: Colors.white,
                                    number: '13', onColorChanged: (Color value) {  },
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                            //  color: Colors.red.shade600,
                              child: Column(
                                //block A
                                children: [
                                  ParkBlock(
                                   color: Colors.blue,

                                    number: '18', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.blue,
                                    number: '19', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,

                                    number: '20', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '21', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,

                                    number: '22', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(

                                    color: Colors.white,
                                    number: '23', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,

                                    number: '24', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '25', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '26', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '27', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '28', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '29', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '30', onColorChanged: (Color value) {  },
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                   //   color: Colors.red.shade400,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              //color: Colors.teal,
                              //blocks B
                              child: Column(
                                children:  [
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '1', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '2', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '3', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '4', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '5', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '6', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '7', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '8', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '9', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '10', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '11', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '12', onColorChanged: (Color value) {  },
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                         //    color: Colors.red.shade200,
                              child: Column(
                                //block B
                                children:  [
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '16', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '17', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '18', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '19', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(

                                    color: Colors.white,
                                    number: '20', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.blue,
                                    number: '21', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                    color: Colors.white,
                                    number: '22', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.white,
                                    number: '23', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.white,
                                    number: '24', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.blue,
                                    number: '25', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                color: Colors.white,
                                    number: '26', onColorChanged: (Color value) {  },
                                  ),
                                  ParkBlock(
                                   color: Colors.blue,
                                    number: '27', onColorChanged: (Color value) {  },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}