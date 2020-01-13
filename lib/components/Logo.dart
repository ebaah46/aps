import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final width;

  final height;

  Logo(this.width, this.height, {Key key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Image.asset('assets/images/appLogo.png',
          alignment: Alignment.center, fit: BoxFit.fill),
    );
  }
}
