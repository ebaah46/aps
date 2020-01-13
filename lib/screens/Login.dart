import 'dart:async';
import 'dart:convert';

import 'package:aps_final/components/Logo.dart';
import 'package:aps_final/screens/NatureOfAccident.dart';
import 'package:aps_final/services/ApiController.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_animations/loading_animations.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login();
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> loginDetails = {'phone': null, 'password': null};
  Future<Response> response;
  var isLogingIn = false;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      backgroundColor: Color.fromRGBO(12, 48, 72, 0.9),
      body: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 30),
          Center(child: Logo(100.0, 100.0)),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 30),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        maxLines: 1,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15.0,
                            color: Colors.white),
                        autofocus: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: "Phone",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                        ),
                        onSaved: (value) {
                          loginDetails['phone'] = value;
                        },
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r'[0-9]{10}').hasMatch(value) ||
                              value.length != 10)
                            return 'Enter correct phone number';
                          else {
                            print('Phone details correct');
                          }
                        },
                        onFieldSubmitted: (value) {
                          _numberFocus.unfocus();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15.0,
                            color: Colors.white),
                        autofocus: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                        ),
                        onSaved: (value) {
                          loginDetails['password'] = value;
                        },
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Enter correct password';
                          else {}
                        },
                        onFieldSubmitted: (value) {
                          _passwordFocus.unfocus();
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: RaisedButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onPressed: () async {
                setState(() {
                  isLogingIn = true;
                  print('changed logging state');
                });
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  await ApiController()
                      .login(loginDetails['phone'], loginDetails['password'])
                      .then((response) async {
                    setState(() {
                      isLogingIn = false;
                      print('request complete');
                    });
                    print(response.token);
                    if (response.success == 1) {
                      // Login Successful
                      final snackbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Login Complete',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        backgroundColor: Colors.greenAccent,
                      );
                      globalKey.currentState.showSnackBar(snackbar);
                      Timer(
                          Duration(seconds: 3),
                          () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NatureOfAccident()))
                              });
                    } else if (response.success == -1) {
                      final snackbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'User not Registered',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      );
                      globalKey.currentState.showSnackBar(snackbar);
                    } else if (response.success == 0) {
                      final snackbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Incorrect Password, Try Again.',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        backgroundColor: Colors.redAccent,
                      );
                      globalKey.currentState.showSnackBar(snackbar);
                    }
                  });
                }
              },
              child: isLogingIn == false
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  : LoadingBouncingGrid.square(
                      backgroundColor: Colors.deepOrangeAccent,
                      size: 25,
                    ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Color.fromRGBO(5, 175, 237, 0.8),
            ),
          )
        ],
      ),
    );
  }
}
