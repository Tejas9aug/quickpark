import 'package:quickpark/home.dart';
import 'package:quickpark/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickpark/authenticate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {

  Function toggleview;
  SignIn({required this.toggleview});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Auth _auth = Auth();
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
        centerTitle: true,
        title: Text('Sign In', style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.indigo[900], fontSize: MediaQuery
                .of(context)
                .size
                .width * 0.07), fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .width * 0.08, vertical: MediaQuery
                .of(context)
                .size
                .height * 0.03),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // SizedBox(height: 20,),
                  Lottie.asset("assets/animation.json", height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.25),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white, width: MediaQuery
                                .of(context)
                                .size
                                .height * 0.003),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue, width: MediaQuery
                                .of(context)
                                .size
                                .height * 0.003),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.1)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue, width: MediaQuery
                                .of(context)
                                .size
                                .height * 0.003),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.1)
                        ),
                        hintText: "Email-id"
                    ),
                    //validator: (val) => val.isEmpty ? "Enter an email": null,
                    validator: (String? val) {
                      if (val != null && val.isEmpty) {
                        return 'Enter Email';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.025,),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white, width: MediaQuery
                                .of(context)
                                .size
                                .height * 0.003),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue, width: MediaQuery
                                .of(context)
                                .size
                                .height * 0.003),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.1)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue, width: MediaQuery
                                .of(context)
                                .size
                                .height * 0.003),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.1)
                        ),
                        hintText: "Password"
                    ),
                    obscureText: true,
                    //  validator: (val) => val.length<6 ? "Enter a strong password": null,
                    validator: (String? val) {
                      if (val != null && val.length < 6) {
                        return 'enter a strong password';
                      } else {
                        return null;
                      }
                    },


                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.025,),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.blueAccent)

                    ),

                    child: Text('Log In', style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02, fontWeight: FontWeight.w600)),),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        FirebaseAuth auth = FirebaseAuth.instance;
                        User user;
                        // setState(() {
                        //   loading = true;
                        // });
                        print(result);
                        if (result == _auth.error) {
                          error = _auth.error;
                          loading = false;

                          return showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    title: Text(
                                      "Warning!",
                                    ),
                                    content: Text(error),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Ok',
                                        ),
                                      )
                                    ],
                                  ));
                        }
                        user = auth.currentUser!;
                        user.reload();
                        if (user.emailVerified) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) =>
                                  MyHomePage()));
                        }
                        else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) =>
                                  verify()));
                        }
                      }
                    },
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.002,),
                  TextButton(onPressed: () => widget.toggleview(),
                      child: Text("Don't have an account? Register",
                          style: GoogleFonts.openSans(textStyle: TextStyle(
                              color: Colors.blue[900], fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.0195, fontWeight: FontWeight.w600))))
                  ,
                  TextButton(onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: email);
                      return showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: Text(
                                  "Note",
                                ),
                                content: Text(
                                    "Password reset link sent to your registered email-Id."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Ok',
                                    ),
                                  )
                                ],
                              ));
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      String warn;
                      if (e.code == "unknown") {
                        warn = "Enter an email-Id.";
                      }
                      else if (e.code == "user-not-found") {
                        warn = "User not found.";
                      }
                      else if (e.code == "invalid-email") {
                        warn = "Enter a valid email.";
                      }
                      else {
                        warn = "Unknown error occured ";
                      }
                      return showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: Text(
                                  "Warning!",
                                ),
                                content: Text(warn),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Ok',
                                    ),
                                  )
                                ],
                              ));
                    }
                  },
                      child: Text("Forgot Password?",
                          style: GoogleFonts.openSans(textStyle: TextStyle(
                              color: Colors.blue[900], fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.0195, fontWeight: FontWeight.w600))))
                ],
              ),
            )
        ),
      ),
    );
  }
}