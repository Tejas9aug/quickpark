import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widget/Rate_card.dart';
class PastParking extends StatefulWidget {
  const PastParking({Key? key}) : super(key: key);

  @override
  State<PastParking> createState() => _PastParkingState();
}

class _PastParkingState extends State<PastParking> {
  @override
  String name="";
  Future _getUsername() async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          name= snapshot.data()!["name"];


        });
      }
    });
  }
  void initState() {
    super.initState();
   // _determinePosition();
    _getUsername();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.only(left: 55.0),
            child: Text("Past Parking")),
      ),
      body: SingleChildScrollView(


          physics: BouncingScrollPhysics(),
          child: Column(

              children: <Widget>[
                // TopBar_home(),
                Container(
                    width: double.infinity,
                    color: Colors.blue.shade200,
                    padding: EdgeInsets.fromLTRB(1, 11, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                                name+" , Here are your Past Parking",
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Column(
                              children:[ Padding(
                                padding: EdgeInsets.only(left: 28,top: 40,right: 28,bottom: 10),
                                child: Card(
                                  color: Colors.white,
                                  elevation: 10,
                                  child: Container(
                                    padding:
                                    EdgeInsets.fromLTRB(15, 9, 10,10),
                                    width: double.infinity,
                                    height: 50,
                                    child: Row(
                                      children: [
                                        Icon(Icons.search, color: Colors.black),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 70,
                                          child: TextField(
                                            textAlignVertical: TextAlignVertical.center,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Search',
                                                hintStyle: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400))),
                                          ),
                                        )
                                      ],
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPaymentPage()));

                    },

                    title: Text("COEP",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.5,
                          letterSpacing: 0.2
                      ),),
                    subtitle: Text("Shivaji Nagar",
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
                          rating: 4.0, onRatingChanged: (double rating) {  },
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
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPaymentPage()));

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
                          rating: 3.5, onRatingChanged: (double rating) {  },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          '\u20B9 50.price',
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

                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPaymentPage()));

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
                          rating: 3.5, onRatingChanged: (double rating) {  },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          '\u20B9 50.price',
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
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPaymentPage()));

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
                          rating: 3.5, onRatingChanged: (double rating) {  },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          '\u20B9 50.price',
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
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPaymentPage()));

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
                          rating: 3.5, onRatingChanged: (double rating) {  },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          '\u20B9 50.price',
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
