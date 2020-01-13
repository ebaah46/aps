import 'package:flutter/material.dart';

class LogoOnly extends StatefulWidget {
  final width;
  final height;
  LogoOnly(this.width, this.height, {Key key}) : super(key: key);

  @override
  _LogoOnlyState createState() => _LogoOnlyState();
}

class _LogoOnlyState extends State<LogoOnly> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Image.asset('assets/images/appLogo-full.png',
          alignment: Alignment.center, fit: BoxFit.fill),
    );
  }
}
