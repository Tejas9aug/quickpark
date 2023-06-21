import 'package:quickpark/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickpark/user.dart';
import 'package:quickpark/toggle.dart';
import 'package:quickpark/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users>(context);
    final auth  = FirebaseAuth.instance;
    User? user1;
    user1 = auth.currentUser;

    if(user==null){
      return Toggle();
    }
    else if(!user1!.emailVerified){
      return verify();
    }
    else {
      return MyHomePage();
    }
  }
}