import 'package:finalproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Welcome.dart';
import 'package:finalproject/signin.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'home.dart';
import 'register.dart';
import 'dialog.dart';
import 'forgotpass.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "final",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: FirstView.id,
        routes: {
          FirstView.id: (context) => FirstView(),
          Signin.id:(context) =>Signin(),
          Home.id:(context) =>Home(),
          Register.id:(context) => Register(),
          dialog.id:(context) => dialog(),
          Forgot.id:(context)=> Forgot(),
        //  ProfileView.id:(context) => ProfileView()
        },

      ),
    );

  }
}
