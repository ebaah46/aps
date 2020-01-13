import 'package:aps_final/screens/DescriptionOfAccident.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class Priority extends StatefulWidget {
  @override
  _PriorityState createState() => _PriorityState();
  Priority({Key key}) : super(key: key);
}

class _PriorityState extends State<Priority> {
  double _sliderValue = 5.0;

  bool _showHighSlider = false;
  bool _showModerateSlider = false;
  bool _showLowSlider = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[800],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DescriptionOfAccident()));
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
      ),
      backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
      appBar: AppBar(
        title: Text('Priority of accident'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 1 / 12 * screenHeight,
              width: screenwidth,
              child: Center(
                child: Text('How serious is the accident?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ),
            ),
            Positioned(
                top: 2 / 12 * screenHeight,
                // width: 8 * screenwidth / 10,
                left: 1 * screenwidth / 12,
                right: 1 * screenwidth / 12,
                child: _showHighSlider == true
                    ? Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              highText('High'),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: _showHighSlider == false
                                      ? IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              _showHighSlider = true;
                                              _showModerateSlider = false;
                                              _showLowSlider = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              _showHighSlider = false;
                                            });
                                          },
                                        ))
                            ],
                          ),
                          _space(screenwidth),
                          _slider(screenHeight, screenwidth, _sliderValue)
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              highText('High'),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: _showHighSlider == false
                                      ? IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              _showHighSlider = true;
                                              _showModerateSlider = false;
                                              _showLowSlider = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              _showHighSlider = false;
                                            });
                                          },
                                        ))
                            ],
                          ),
                          _space(screenwidth),
                        ],
                      )),
            Positioned(
                top: 4 / 12 * screenHeight,
                // width: 8 * screenwidth / 10,
                left: 1 * screenwidth / 12,
                right: 1 * screenwidth / 12,
                child: _showModerateSlider == true
                    ? Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              highText('Moderate'),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: _showModerateSlider == false
                                      ? IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              _showModerateSlider = true;
                                              _showLowSlider = false;
                                              _showHighSlider = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              _showModerateSlider = false;
                                            });
                                          },
                                        ))
                            ],
                          ),
                          _space(screenwidth),
                          _slider(screenHeight, screenwidth, _sliderValue),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              highText('Moderate'),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: _showModerateSlider == false
                                      ? IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              _showModerateSlider = true;
                                              _showHighSlider = false;
                                              _showLowSlider = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              _showModerateSlider = false;
                                            });
                                          },
                                        ))
                            ],
                          ),
                          _space(screenwidth),
                        ],
                      )),
            Positioned(
                top: 6 / 12 * screenHeight,
                // width: 8 * screenwidth / 10,
                left: 1 * screenwidth / 12,
                right: 1 * screenwidth / 12,
                child: _showLowSlider == true
                    ? Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              highText('Low'),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: _showLowSlider == false
                                      ? IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              _showLowSlider = true;
                                              _showModerateSlider = false;
                                              _showHighSlider = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              _showLowSlider = false;
                                            });
                                          },
                                        ))
                            ],
                          ),
                          _space(screenwidth),
                          _slider(screenHeight, screenwidth, _sliderValue)
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              highText('Low'),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: _showLowSlider == false
                                      ? IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {
                                            setState(() {
                                              _showLowSlider = true;
                                              _showHighSlider = false;
                                              _showModerateSlider = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: () {
                                            setState(() {
                                              _showLowSlider = false;
                                            });
                                          },
                                        ))
                            ],
                          ),
                          _space(screenwidth),
                        ],
                      )),
            Positioned(
                bottom: 1.4 * screenHeight / 12,
                left: 1.7 * screenwidth / 4,
                child: selectImage())
          ],
        ),
      ),
    );
  }

  Widget highText(String priority) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(priority,
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ],
    );
  }

  Widget _space(double screenwidth) {
    return SizedBox(
      width: 8 * screenwidth / 10,
      height: 5,
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
      ),
    );
  }

  Widget _slider(double screenHeight, double screenwidth, double value) {
    return Container(
      margin: EdgeInsets.only(
        left: 5.0,
      ),
      width: 4 * screenwidth / 5,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          inactiveTickMarkColor: Colors.transparent,
          activeTickMarkColor: Colors.transparent,
          trackHeight: screenHeight / 60,
          activeTrackColor:
              Color.lerp(Colors.red[400], Colors.orange[400], 0.5),
          thumbColor: Colors.white,
          trackShape: RectangularSliderTrackShape(),
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: Slider(
          value: value,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
              print(_sliderValue);
            });
            print('Value changed');
          },
          min: 0.0,
          max: 10.0,
          divisions: 10,
        ),
      ),
    );
  }

  Widget selectImage() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      child: IconButton(
        color: Colors.black,
        iconSize: 36,
        icon: Icon(Icons.camera_alt),
        onPressed: () {
          getImage();
        },
      ),
    );
  }
}

Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
}
