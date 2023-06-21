import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quickpark/Transitions/ScaleTransition.dart';
import 'package:quickpark/receipt.dart';

import '../Transitions/SlideTransition.dart';

class MyPaymentPage extends StatefulWidget{

  @override
  State createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {


  List _paymentMethod = ['Google Pay' , 'Bank Card' , 'Cash' , 'Amazon Pay','Credit Card'];
  bool pressed =false;
   int? pindex;
   int? p1index;

  @override
  Widget build(BuildContext context) {
    double d1 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context,true);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 22,
                ),
              ),

              SizedBox(height: 24,),
              Text(
                'Paradise Garage',
                style: TextStyle(
                  fontSize: 34.4,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),

              SizedBox(height: 6,),
              Text(
                '235 Zemblak Crest Apt. 102',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),




              SizedBox(height: 74,),
              Text(
                'Parking Time',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 17.4
                ),
              ),

              SizedBox(height: 12,),
              SizedBox(
                height: 104,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                // pressed= !pressed;
                                p1index=index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: p1index==index
                                    ?Colors.blue.shade500
                                    :Colors.white,

                              ),
                              width: 134,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${index+1} hours',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          letterSpacing: 0.1

                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                    Text(
                                      '\u20B9 ${index*5 + 10}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),




              SizedBox(height: 14,),
              Text(
                'Custom Range .',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.4,
                    color: Colors.black,
                    letterSpacing: 0.2
                ),
              ),




              SizedBox(height: 60,),
              Text(
                'Payment Type',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15.4
                ),
              ),
              SizedBox(height: 12,),
              SizedBox(
                height: 104,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(

                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Card(

                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: GestureDetector(
                            onTap: (){

                              setState(() {
                              //  color:Colors.black;
                               // pressed= !pressed;
                                pindex=index;
                              });

                            },
                            child: Container(
                              width: 134,
                              decoration: BoxDecoration(
                                color: pindex==index
                                    ?Colors.blue.shade500
                                    :Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(


                                      '${_paymentMethod[index]}',
                                      style:/*pressed
                                        ? TextStyle(color: Colors.yellow)
                                        : TextStyle(color:Colors.white),*/
                                      TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          letterSpacing: 0.1

                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                    Text(
                                      '${index}% GST',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),




              SizedBox(height: d1*0.05,),

             /* Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
              ),*/
              Divider(
                thickness: 2.0,
                color: Colors.black,
              ),




             // SizedBox(height: 34,),
              Padding(
                padding: const EdgeInsets.only(right: 24.0,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total : ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.4,
                          letterSpacing: 0.2
                      ),
                    ),
                    Text(
                      '\u20B9 45.64',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.2
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: d1*0.05,),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(6.0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                      backgroundColor: MaterialStateProperty.all(Colors.black87),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14.0)),

                    ),
                 //   elevation: 6,
                   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    onPressed: (){
                      Navigator.pushReplacement(context, ScaleRoute(page: MyRecipt()));
                    },
                    //color: Colors.black87,
                    //padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'PAY NOW',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 4,
                          letterSpacing: 0.3
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}