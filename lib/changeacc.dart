import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/constants.dart';

class ChangeAcc extends StatefulWidget {
  const ChangeAcc({Key? key}) : super(key: key);

  @override
  State<ChangeAcc> createState() => _ChangeAccState();
}

class _ChangeAccState extends State<ChangeAcc> {

  String name="";
  String pic="";
  String? avatar;
  Future _avatars() async{
  final DocumentReference<Map<String,dynamic>> docRef = FirebaseFirestore.instance.collection('avatar').doc(FirebaseAuth.instance.currentUser!.uid) as DocumentReference<Map<String, dynamic>>;
  final DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await docRef.get();
   avatar = documentSnapshot.data()!['avatar'];
  }
 // String surname="";
  Future _getUsername() async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          name= snapshot.data()!["name"];
        //  surname=snapshot.data()!["surname"];


        });
      }
    });
  }
  Future _getavatar() async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          pic= snapshot.data()!["avatar"];
          //  surname=snapshot.data()!["surname"];


        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
   // _avatars();
  //  _getavatar();
    //_determinePosition();
    _getUsername();
   // _getavatar();
  }
  Widget build(BuildContext context) {
    double d1 = MediaQuery.of(context).size.height;
    double d2 = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 0.0,
        title: RichText(text: TextSpan(
          text: "Hello, ",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: d1*0.026),
          ),
          children: [
            TextSpan(
              text: name,                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: d1*0.026),
                )

            )
          ]
        )),

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(d2 * 0.05, d1*0.03, d2 * 0.05, d1 * 0.013),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: d1*0.14,
                        width: d1*0.14,
                       child: CircleAvatar(
                         radius: 40,
                         child: Text(name.isNotEmpty
                           ?name[0] : "",
                         style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 50),
                         )
                         //child: Image.network(pic),

                          // child: Image.network("$pic",fit: BoxFit.fill,))
                      ),
                      ),
                      SizedBox(height: d1*0.013,),
                      Text("Change Picture",style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color(0xff979797),
                              fontWeight: FontWeight.w500,
                              fontSize: d2 * 0.04)),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: d1*0.08,),
              textField("Change your account name", Color(0xffd9d9d9)),
              textField("Change your password", Color(0xffd9d9d9)),
              SizedBox(height: d1*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Enhance the product",style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff181725),
                          fontWeight: FontWeight.w500,
                          fontSize: d2 * 0.03)),),
                ],
              ),
              SizedBox(height: d1*0.02),
              outlineButton(context,d1,"Reviews and feedback window"),
              outlineButton(context,d1,"Questions and Answers asked"),
              SizedBox(height: d1*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Your Bookings",style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff181725),
                          fontWeight: FontWeight.w500,
                          fontSize: d2 * 0.04)),),
                ],
              ),
              SizedBox(height: d1*0.02),
              outlineButton(context,d1,"Earlier Bookings"),
           //   outlineButton(context,d1,"get into !"),
              SizedBox(height: d1*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Your Addresses",style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff181725),
                          fontWeight: FontWeight.w500,
                          fontSize: d2 * 0.04)),),
                ],
              ),
              SizedBox(height: d1*0.02),
              outlineButton(context,d1,"Existing address"),
              outlineButton(context,d1,"Add a new address"),
              SizedBox(height: d1*0.02),
              ElevatedButton(onPressed: (){},
                  style:ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.greenAccent)),

                  )),
                  child:
                  Container(
                    height: d1*0.072,
                    child: Center(
                      child: Text("Update",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white),fontWeight: FontWeight.w500),),
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
