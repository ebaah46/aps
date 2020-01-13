import 'package:aps_final/components/Appbar.dart';
import 'package:aps_final/screens/Priority.dart';
import 'package:flutter/material.dart';

class NatureOfAccident extends StatefulWidget {
  @override
  _NatureOfAccidentState createState() => _NatureOfAccidentState();

  NatureOfAccident({Key key}) : super(key: key);
}

class _NatureOfAccidentState extends State<NatureOfAccident> {
  var accidentNature = [
    {'name': 'FIRE', 'image': 'assets/images/fire.png'},
    {'name': 'ELECTRICITY', 'image': 'assets/images/electricity.png'},
    {'name': 'BLOODY', 'image': 'assets/images/bloody.png'},
    {'name': 'PREGNANCY', 'image': 'assets/images/pregnant.png'},
    {'name': 'PANDEMIC', 'image': 'assets/images/pandemic.png'},
    {'name': 'NATURAL DISASTER', 'iamge': 'assets/images/naturalD.png'}
  ];
  bool switchState = false;
  int _personsInvolved = 0;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[800],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Priority()));
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
      ),
      backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
      appBar: AppBar(
        title: MyAppBar('Nature of accident'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: Text('What is the nature of this accident?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 250,
              width: 250,
              child: Center(
                child: GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: List.generate(6, (item) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = true;
                            });
                          },
                          child: GridTile(child: gridItems(item)));
                    })),
              ),
            ),
          ),
          Expanded(child: personsInvolved())
        ],
      ),
    );
  }

  Widget gridItems(int item) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = true;
          print('You clicked: ${accidentNature[item]['name']}');
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.green, width: 1.5)
                  ),
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Image.asset(
                '${accidentNature[item]['image']}',
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              )),
          SizedBox(height: 10),
          Text(
            '${accidentNature[item]['name']}',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget personsInvolved() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'How many persons were involved?',
              style: TextStyle(
                  fontFamily: 'Roboto', color: Colors.white, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  _personsInvolved.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _personsInvolved++;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          size: 18,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_personsInvolved > 0) {
                              _personsInvolved--;
                            } else {}
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            width: 70,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.white, width: 2))),
          )
        ],
      ),
    );
  }
}
