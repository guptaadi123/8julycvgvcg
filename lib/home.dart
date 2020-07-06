import 'package:finalproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'Welcome.dart';


class Home extends StatelessWidget {
  static const String id = 'Home';
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.brown ,
        appBar: AppBar(
          title: Text('Book Slot'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                  await _auth.signout();
                  Navigator.pushNamed(context, FirstView.id);

              },
            )
          ],
        ),

      ),
    );
  }
}

