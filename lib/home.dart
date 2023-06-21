import 'package:quickpark/new/home2.dart';
import 'package:quickpark/parking_overview.dart';
import 'package:quickpark/toggle.dart';
import 'package:flutter/material.dart';
import 'package:quickpark/authenticate.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickpark/aboutus.dart';
import 'package:quickpark/changeacc.dart';
import 'package:quickpark/direction.dart';


import 'package:quickpark/map.dart';


import '../Widget/Rate_card.dart';

import 'localmap.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  Auth auth = Auth();

  //get name => name;
  @override
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text("Location Disabled"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Text("Your location is disabled,please enable to use the app & Restart the app")
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Geolocator.openLocationSettings();
                    },
                    child: const Text("Okay"))
              ],
            );
          });

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text("Location Permission Require!"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Location permission is require to use the app")
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);

                        permission = await Geolocator.requestPermission();
                      },
                      child: const Text("Okay"))
                ],
              );
            });

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: const Text("Location Permission Require!"),
      //         content: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: const [
      //             Text("Location permission is require to use the app")
      //           ],
      //         ),
      //         actions: [
      //           TextButton(
      //               onPressed: () async {
      //                 Navigator.pop(context);
      Geolocator.openAppSettings();
      //               },
      //               child: const Text("Okay"))
      //         ],
      //       );
      //     });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  String name="";
  String emailid="";
  Future _getUsername() async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          name= snapshot.data()!["name"];


        });
      }
    });
  }
  Future _getEmailId() async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          emailid= snapshot.data()!["emailId"];


        });
      }
    });
  }





  //String UserName=document.onLoadedData as String;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _getUsername();
    _getEmailId();
  }
  @override
  Widget build(BuildContext context) {
    double d2= MediaQuery.of(context).size.width;
    _determinePosition();
    return Scaffold(

      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.blue[200],
          elevation: 0.0,

          child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(7.0,30.0, 10.0, 10.0),
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        Align(
                          alignment:Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(
                                text: "Hello, ",
                                style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.w500,fontSize: 20)),
                                children: [
                                  TextSpan(
                                    text: name,
                                    style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.w400,fontSize:20)),

                                  ),


                                ]
                            ),

                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: RichText(text: TextSpan(text: emailid,style: GoogleFonts.montserrat(textStyle: TextStyle(
                                fontSize: 17,color: Colors.blue.shade700)))))
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 2.0,
                  color: Colors.black87,),
                Expanded(
                  child: Container(padding: EdgeInsets.fromLTRB(10, 14, 5, 2),
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage()));
                          },
                          //leading: Image.asset("assets/home.png",height: 30,),
                          leading: Icon(Icons.home,
                            size: 40.0,
                          ),
                          title: Text("Home",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                        ),
                        Divider(thickness: 2.0,
                          color: Colors.black87,),
                        ListTile(
                          tileColor: Colors.blue[200],
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeAcc()));

                          },
                          leading: Image.asset("assets/user.png",height: 30,),
                          title: Text("Profile",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                        ),
                        Divider(thickness: 2.0,
                          color: Colors.black87,),

                        /*ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ParkingOverview()));

                          },
                          leading: Image.asset("assets/logo.png",height: 30,),
                          title: Text("OverView",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                        ),*/

                        ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocalMap()));

                          },
                          leading: Image.asset("assets/localmap.png",height: 30,),
                          title: Text("Local Map",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                        ),
                        Divider(thickness: 2.0,
                          color: Colors.black87,),
                        ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));

                          },
                          leading: Image.asset("assets/logo.png",height: 30,),
                          title: Text("About Us",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                        ),
                        Divider(thickness: 2.0,
                          color: Colors.black87,),

                         ListTile(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));

                              },
                              leading: Icon(Icons.art_track,
                                size: 40.0,
                              ),
                              title: Text("Map View",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                            ),
                        Divider(
                          thickness: 2.0,
                          color: Colors.black,
                        ),
                        ListTile(
                          onTap: (){
                            auth.signOut();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Toggle()));

                          },
                          leading: Icon(Icons.logout,
                            size: 30.0,
                          ),
                          title: Text("Logout",style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),),
                        ),

                        Divider(thickness: 2.0,
                          color: Colors.black87,),


                        Container(
                          height: MediaQuery.of(context).size.height*0.28,
                          width: MediaQuery.of(context).size.width*0.7,
                          //height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Developed by :",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*0.02),
                                ),
                              ),
                              Text("Tejas Patange",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*0.02),
                                ),

                              ),
                              //SizedBox(height: 10,),
                              Divider(
                                thickness: 1.0,
                                color: Colors.black,
                              )
                            ],
                          ),

                        ),


                      ],
                    ),

                  ),
                )

              ]
          ),

          //  Divider(height: 2,color: Colors.white,),,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,

        title: Text("Quick Park",
            style: TextStyle(
                color: Colors.blue.shade700,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quickstand'
            )
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: ()
            {
              auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Toggle()));
            },
          ),
          /*  IconButton(
            icon: Icon(Icons.menu),
            iconSize: 26,
            color: Colors.white.withOpacity(0.9),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            //  Icons.menu,
            //  color: Colors.white.withOpacity(0.9),
            // size: 26,
          ),*/

          /*Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white.withOpacity(0.9),
                        size: 24,
                      ),
                    )*/
        ],
        backgroundColor: Colors.blue[100],
        elevation: 0.0,
        /* leading: Builder(
          builder: (context)=>IconButton(
            icon: Icon(Icons.menu),
        iconSize: 26,
        color: Colors.white.withOpacity(0.9),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        //  Icons.menu,
        //  color: Colors.white.withOpacity(0.9),
        // size: 26,
      ),
        ),*/
      ),


      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            children: <Widget>[
              // TopBar_home(),
              Container(
                  width: double.infinity,
                  color: Colors.blue[100],
                  padding: EdgeInsets.fromLTRB(1, 11, 10, 10),
                  child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            name+" " + " , Welcome to Quick Park",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20)),
                          ),
                        ),

                        Column(
                            children:[ Padding(
                              padding: EdgeInsets.only(left: d2*0.05,top: 20,right: 28,bottom: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Card(

                                  color: Colors.white,
                                  elevation: 10,

                                  child: SizedBox(
                                    width: d2*0.5,
                                    child: ElevatedButton(onPressed: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MapView()));
                                    },
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue.shade300)),
                                        child: Text("Search by Map",
                                        style: TextStyle(color: Colors.blue.shade700,
                                          fontSize: 20
                                        ),
                                        )),
                                  ),
                                ),
                              ),
                              //  elevation: 8,


                            ),



                            ]
                        ),
                      ]
                  )
              ),
              SizedBox(height: 20,),


              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListTile(
                  tileColor: Colors.black38,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));

                  },

                  title: Text("Shivaji Nagar",
                    style: TextStyle(
                        color: Colors.black87,

                        fontWeight: FontWeight.w700,
                        fontSize: 17.5,
                        letterSpacing: 0.2
                    ),),
                  subtitle: Text("COEP",
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: StarRating(
                        color: Colors.black87,
                        size: 20,
                        // color: Colors.yellow,
                        rating: 4.5, onRatingChanged: (double rating) {  },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        '\u20B9 40.price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 17
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black87,
              ),
              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListTile(
                  //dense: true,
                  //visualDensity: VisualDensity(vertical: -2),
                  tileColor: Colors.black38,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));

                  },

                  title: Text("Swargate",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.5,
                        letterSpacing: 0.2
                    ),),
                  subtitle: Text("Beside Main Bus Stand",
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: StarRating(
                        color: Colors.black87,
                        size: 20,
                        // color: Colors.yellow,
                        rating: 4.5, onRatingChanged: (double rating) {  },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        '\u20B9 60.price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 17
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black87,
              ),
              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListTile(
                  tileColor: Colors.black38,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));

                  },

                  title: Text("VallabhNagar",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.5,
                        letterSpacing: 0.2
                    ),),
                  subtitle: Text("Beside Main Bus Stand",
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: StarRating(
                        color: Colors.black87,
                        size: 20,
                        // color: Colors.yellow,
                        rating: 4.5, onRatingChanged: (double rating) {  },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        '\u20B9 40.price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 17
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black87,
              ),
              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListTile(
                  tileColor: Colors.black38,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));

                  },

                  title: Text("Katraj",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.5,
                        letterSpacing: 0.2
                    ),),
                  subtitle: Text("Beside Rajiv Gandhi Zoo",
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: StarRating(
                        color: Colors.black87,
                        size: 20,
                        // color: Colors.yellow,
                        rating: 3.5, onRatingChanged: (double rating) {  },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        '\u20B9 40.price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 17
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black87,
              ),
              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListTile(
                  tileColor: Colors.black38,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));

                  },

                  title: Text("Kothrud ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.5,
                        letterSpacing: 0.2
                    ),),
                  subtitle: Text("Beside MPrakash IIT Coaching",
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: StarRating(
                        color: Colors.black87,
                        size: 20,
                        // color: Colors.yellow,
                        rating: 4.5, onRatingChanged: (double rating) {  },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        '\u20B9 60.price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 17
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black87,
              ),

            ]
        ),


        /*Stack(
            children: <Widget>[
              TopBar_home(),
              Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left: 28,top: 40,right: 28,bottom: 10),
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
                          trailing: GestureDetector(
                            onTap: (){
                              Navigator.push(context, FadeRoute(page: MapView()));
                            },
                            child: Icon(
                              Icons.search,
                              size: 27,
                              color: Colors.orange[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Recents(),
                ],
              )
            ],
          ),*/


      ),



    );
  }
}
