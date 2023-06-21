import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kdark = Color(0xFF21242A);
const klightYellow = Color(0xFFFEEB83);
const kyellow = Color(0xFFFFD701);
const String api_key = "AIzaSyCeCgxLq8nGY0rOX9n4lhITMYAJ4g4AMC4";
Widget textField(String text,Color color){
  return Material(
    child: TextFormField(
      decoration: InputDecoration(
          hintText: text,
          hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: color,fontWeight: FontWeight.w500))

      ),
    ),
  );
}
Widget outlineButton(BuildContext context,double d1,String text){
  return OutlinedButton(onPressed: (){},
      style:ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.greenAccent)),

      )),
      child:Container(
        height: d1*0.072,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black)),)
          ],
        ),
      ) );
}


class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth=1080.0;
  static double screenHeight=720.0;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / screenHeight) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / screenWidth) * screenWidth;
}