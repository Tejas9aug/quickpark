import 'package:flutter/material.dart';
import 'package:quickpark/helper/constants.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),

      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(30.0),
            ),
            Container(
              decoration: BoxDecoration(
                //  color: kWhiteColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(getProportionateScreenHeight(50.0))),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0.5, 1))
                  ]),
              child: Image.asset(
                "assets/logo.png",
                height: getProportionateScreenHeight(110.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                "Quick Park",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Parking Vehicle",
                style: TextStyle(color: Colors.red.shade600),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20.0),
            ),
            Center(
              child: Container(
                width: SizeConfig.screenWidth * 0.9,
                decoration: BoxDecoration(
                 //   color: kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hello!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome To The Best Deals On Parking Services In India.",
                        style: TextStyle(color: Colors.red.shade600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Quick Park  is a unit of Quick Park Private Limited",
                        style: TextStyle(color: Colors.blueGrey.shade600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              "We are a trusted technology company headquarted in Pune and Branch at Aurangabad. We have already proven our credibility into car driver management, serving this industry since 2009.",
                              style: TextStyle(color: Colors.blueGrey.shade600),
                            ),
                            TextSpan(
                              text:
                              "\n\nOur technology service enable our customer a effortless Parking  of vehicle .",
                              style: TextStyle(color: Colors.blueGrey.shade600),
                            ),
                            TextSpan(
                              text:
                              "\n\nWe are continually evolving out technical abilities to make parking service faster,easier and reliable.",
                              style: TextStyle(color: Colors.blueGrey.shade600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: GestureDetector(
                onTap: () {
                //  launchUrl(Uri.parse("tel:02067641000"));
                },
                child: Container(
                  decoration: BoxDecoration(
                    //  color: kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Call Us"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("9359093824")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
          ],
        ),
      ),

    );
  }
}
