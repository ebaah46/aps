import 'dart:async';

import 'package:aps_final/components/Logo.dart';
import 'package:aps_final/screens/Login.dart';
import 'package:aps_final/services/ApiController.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class SignUp extends StatefulWidget {
  SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> signUpDetails = {
    'phone': null,
    'password': null,
    'repeatPassword': null
  };
  bool termsAndConditions = false;
  bool buttonState = false;
  bool isSigningUp = false;
  final __globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: __globalKey,
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
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 20),
          Center(child: Logo(100.0, 100.0)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Form(
              key: _formKey,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
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
                          signUpDetails['phone'] = value;
                        },
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r'[0-9]{10}').hasMatch(value) ||
                              value.length != 10)
                            return 'Enter correct phone number';
                          else {}
                        },
                        onFieldSubmitted: (value) {
                          _numberFocus.unfocus();
                        },
                      ),
                    ),
                    SizedBox(height: 5),
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
                          signUpDetails['password'] = value;
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
                    SizedBox(height: 15),
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
                          labelText: " Confirm Password",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                        ),
                        onSaved: (value) {
                          signUpDetails['repeatPassword'] = value;
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
                  ],
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.lightGreenAccent[400],
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: (value) {
                      setState(() {
                        termsAndConditions = value;
                        if (termsAndConditions == true) buttonState = true;
                      });
                    }),
                Text('I agree to all terms and conditions',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.white))
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onPressed: () async {
                if (validateForm() == true &&
                    signUpDetails['password'] ==
                        signUpDetails['repeatPassword'])
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => Login()));
                  setState(() {
                    isSigningUp = true;
                  });
                await ApiController()
                    .register(signUpDetails['phone'], signUpDetails['password'])
                    .then((response) async {
                  setState(() {
                    isSigningUp = false;
                  });
                  if (response.success == 1) {
                    // Login Successful
                    final snackbar = SnackBar(
                      content: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Registration Complete',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      backgroundColor: Colors.greenAccent,
                    );
                    __globalKey.currentState.showSnackBar(snackbar);
                    Timer(
                        Duration(seconds: 3),
                        () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()))
                            });
                  } else if (response.success == 0) {
                    final snackbar = SnackBar(
                      content: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Registration Failed, Try Again.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    );
                    __globalKey.currentState.showSnackBar(snackbar);
                  }
                });
              },
              child: isSigningUp == false
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Sign Up',
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
                  borderRadius: BorderRadius.circular(80)),
              color: Color.fromRGBO(5, 175, 237, 0.8),
            ),
          )
        ],
      ),
    );
  }

  bool validateForm() {
    if (_formKey.currentState.validate() &&
        termsAndConditions == true &&
        buttonState == true) {
      _formKey.currentState.save();
      return true;
    } else
      return false;
  }
}
