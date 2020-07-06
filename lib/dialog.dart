import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'register.dart';
import 'Welcome.dart';
class dialog extends StatelessWidget {
  static const String id = 'dialog';
  final primaryColor = const Color(0xFF75A2EA);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: _height * 0.10,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 44.0, color: Colors.white),
                ),
                SizedBox(
                  height: _height * 0.10,
                ),
                AutoSizeText(
                  "BOOK YOUR SLOTS ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
                SizedBox(
                  height: _height * 0.15,
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),


                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 30.0, bottom: 15.0, right: 30.0),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400),
                    ),

                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Register.id);
                  },
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),


                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 30.0, bottom: 15.0, right: 30.0),
                    child: Text(
                      "May be later",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400),
                    ),

                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, FirstView.id);
                  },
                )

              ],
            ),
          ),
        ),


      ),

    );
  }

}
