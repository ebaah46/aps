import 'package:aps_final/components/Logo.dart';
import 'package:aps_final/components/Name.dart';
import 'package:aps_final/screens/Home.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    print('Screenheight: $screenHeight and ScreenWidth: $screenwidth');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
        body: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              top: 2.5 / 12.0 * screenHeight,
              child: Logo(220.0, 220.0),
            ),
            Positioned(top: 6 / 12 * screenHeight, child: Name()),
            Positioned(top: 7 / 12 * screenHeight, child: details()),
            Positioned(
              bottom: 1.0 / 12.0 * screenHeight,
              right: 1.0 / 12.0 * screenwidth,
              child: getStarted(context),
            )
          ],
        ),
      ),
    );
  }

  Widget details() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Text(
              'Life Saver',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          SizedBox(
            child: Text(
              '|',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            child: Text('Digital Health Tool',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
          SizedBox(
            child: Text(
              '|',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text('Alarm Button',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget getStarted(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 50),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Home()));
        },
        onLongPress: () {},
        onDoubleTap: () {},
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2),
                child: Text('Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white)),
              ),
              Platform.isIOS
                  ? Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    )
            ]),
      ),
    );
  }
}
