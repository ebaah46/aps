import 'package:aps_final/components/Name.dart';
import 'package:aps_final/screens/Login.dart';
import 'package:aps_final/screens/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:slide_button/slide_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:aps_final/components/Logo.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDragging = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(top: 2 / 12 * screenHeight, child: Logo(220.0, 220.0)),
            Positioned(top: 5.5 / 12 * screenHeight, child: Name()),
            Positioned(
                top: 6.5 / 12 * screenHeight, child: callAmbulanceText()),
            Positioned(top: 7.5 / 12 * screenHeight, child: swipeToCall()),
            Positioned(top: 9.5 / 12 * screenHeight, child: loginOrSignUp()),
          ],
        ),
      ),
    );
  }

  Widget callAmbulanceText() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Call the National Ambulance Service',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'Roboto'),
        ),
      ),
    );
  }

  Widget swipeToCall() {
    return Center(
        // child: Container(
        //   decoration: BoxDecoration(
        //       color: Colors.greenAccent[400],
        //       borderRadius: BorderRadius.circular(50)),
        //   height: 50,
        //   width: 300,
        //   margin: EdgeInsets.only(top: 10),
        //   padding: EdgeInsets.only(),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       // Row(
        //   children: <Widget>[
        //     Draggable(
        //       axis: Axis.horizontal,
        //       child:
        //           Icon(Icons.arrow_forward, size: 30, color: Colors.white),
        //       feedback:
        //           Icon(Icons.arrow_forward, size: 30, color: Colors.white),
        //       onDragStarted: () {
        //         setState(() {
        //           isDragging = true;
        //         });
        //       },
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(left: 10, right: 5),
        //       child: Text('Swipe To Place Call',
        //           style: TextStyle(
        //               letterSpacing: 1.0,
        //               fontSize: 22,
        //               color: Colors.white,
        //               fontWeight: FontWeight.w400)),
        //     )
        //   ],
        // )
        child: Container(
      width: 300,
      child: SlideButton(
          height: 50,
          backgroundChild: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Swipe to Place Call',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontFamily: "Roboto")),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          slideDirection: SlideDirection.RIGHT,
          slidingChild: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.white,
            ),
          ),
          confirmPercentage: 0.9,
          initialSliderPercentage: 0.1,
          slidingBarColor: Colors.greenAccent[400],
          backgroundColor: Colors.greenAccent[700],
          borderRadius: 50,
          onButtonOpened: () {
            callEmergency();
          }),
    )
        //     ],
        //   ),
        // ),
        );
  }

  Widget loginOrSignUp() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already registered?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Roboto'),
                    ),
                    InkWell(
                      splashColor: Colors.amberAccent,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(' Login',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Roboto')),
                    )
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('or',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.white)),
                  InkWell(
                    splashColor: Colors.amberAccent,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(' Sign Up',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: Colors.white,
                            fontStyle: FontStyle.italic)),
                  )
                ],
              )
            ],
          )),
    );
  }

  callEmergency() async {
    print("Initiating call");
    const url = 'tel:030 278 7301';
    if (await canLaunch(url)) {
      await launch(url);
      print("Call made");
    } else {
      throw 'Could not launch $url';
    }
  }
}
