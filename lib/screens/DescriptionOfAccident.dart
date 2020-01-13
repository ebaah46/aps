import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';

import 'SendAlarm.dart';

class DescriptionOfAccident extends StatefulWidget {
  @override
  _DescriptionOfAccidentState createState() => _DescriptionOfAccidentState();

  DescriptionOfAccident({Key key}) : super(key: key);
}

class _DescriptionOfAccidentState extends State<DescriptionOfAccident> {
  Position _position;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[800],
        onPressed: () {
          getPosition();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SendAlarm()));
        },
        child: Icon(
          Icons.check,
          size: 40,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
        title: Text('Description of accident'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    width: 4 * screenWidth / 5,
                    child: Text(
                      'Add short notes on the nature of the accident',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                    decoration: InputDecoration(
                        labelText: 'Click to add text',
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // Text(_position == null
                //     ? 'Checking Location'
                //     : "Lat: ${_position.latitude}, Long: ${_position.longitude}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _position = position;
    });
    print(position);
  }
}
