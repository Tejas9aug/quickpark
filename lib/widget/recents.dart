import 'package:flutter/material.dart';
import 'package:quickpark/payment.dart';
import 'package:quickpark/widget//Rate_card.dart';
import 'package:quickpark/helper/fixed_data.dart';

class Recents extends StatefulWidget{

  @override
  State createState() => _RecentState();
}

class _RecentState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: recentList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 24),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 6,
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${recentList[index].title}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.5,
                                letterSpacing: 0.2
                            ),
                          ),
                          subtitle: Text(
                            '${recentList[index].subtitle}',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.5,
                                letterSpacing: 0.1

                            ),
                          ),
                     //     onTap: Navigator.pushNamed(context, routeName),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPaymentPage()));
                          },
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
                                  color: Colors.white,
                                  size: 20,
                                 // color: Colors.yellow,
                                  rating: recentList[index].rating, onRatingChanged: (double rating) {  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text(
                                  '\u20B9 ${recentList[index].price}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            );
          }
      ),
    );
  }

}