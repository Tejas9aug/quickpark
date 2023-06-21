import 'package:flutter/material.dart';
import 'package:quickpark/register.dart';
import 'package:quickpark/signin.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {

  bool isSignIn = true;

  void toggleview(){
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isSignIn){
      return SignIn(toggleview: toggleview);
    }
    else{
      return Register(toggleview: toggleview);
    }
  }
}