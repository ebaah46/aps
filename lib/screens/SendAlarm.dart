import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class SendAlarm extends StatefulWidget {
  @override
  _SendAlarmState createState() => _SendAlarmState();
  SendAlarm({Key key}) : super(key: key);
}

class _SendAlarmState extends State<SendAlarm> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Ambulance will be there in',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                _space(20),
                SlideCountdownClock(
                  duration: Duration(minutes: 2),
                  slideDirection: SlideDirection.Up,
                  separator: ':',
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  onDone: () {
                    _globalKey.currentState.showSnackBar(SnackBar(
                      content: Text('Ambulance almost here'),
                      backgroundColor: Colors.greenAccent,
                    ));
                  },
                )
              ],
            ),
            _space(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('First Aid Tips',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                _space(10),
                ListTile(
                  title: Text(
                    'Please do as instructed, the ambulance will be in soon.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _space(5),
                ListTile(
                  title: Text(
                    'Stay calm no matter the state of the accident.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                _space(5),
                ListTile(
                  title: Text(
                    'If the victim has any broken bones, he or she must remain still.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    softWrap: true,
                  ),
                ),
                _space(5),
                ListTile(
                  title: Text(
                    'If you can try to stop bleeding from any part of victim.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    softWrap: true,
                  ),
                ),
                _space(35),
                RaisedButton(
                  color: Colors.redAccent,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Send Alarm',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _space(double space) {
    return SizedBox(
      height: space,
    );
  }
}
