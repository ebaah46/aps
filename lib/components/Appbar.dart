import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final title;
  MyAppBar(this.title, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: TextStyle(fontSize: 22, fontFamily: 'Roboto'),
    );
  }
}
