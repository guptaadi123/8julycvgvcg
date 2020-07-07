import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//
final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
//
class Home extends StatefulWidget {
  static const String id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}
//
class _HomeState extends State<Home> {
  final messageTextController = TextEditingController();
  final Date = TextEditingController();
  final _auth = FirebaseAuth.instance;
//
  String messageText;
  String Datetext;


  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Slot booking'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//

                  SizedBox(height: 16.0,),
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
            SizedBox(height: 16.0,),
            Expanded(
              child: TextField(
                controller: Date,
                onChanged: (value) {
                  Datetext = value;
                },
                  decoration: InputDecoration(hintText: 'Date')
              ),
            ),
SizedBox(height: 16.0,),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      Date.clear();
                      _firestore.collection('messages').add({
                        'Slot': messageText,
                        'sender': loggedInUser.email,
                        'Date':Datetext,
                      });
                    //Navigator.pushNamed(context, ProfileView.id) ;
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
             ]
              ),
            ),

        );


  }
}