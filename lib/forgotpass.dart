import 'package:flutter/material.dart';
import 'services/auth.dart';

class Forgot extends StatefulWidget {
  static const String id = 'Forgot';
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String error ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.pink,
              child: Text(
                'Reset password',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  dynamic result = await _auth.sendPasswordResetEmail(email);
                  if(result==null){
                    setState(() => error = 'pleasse supply a valid email');

                  }else{
                    print('email sent succefull');
                   //Navigator.pushNamed(context, Home.id);
                  }
                  //dynamic result = await _auth.sendPasswordResetEmail(email);

                  //print(name);
                  //print(name);
                  print(email);
                  //print(password);
//                    if(result==null){
//                      setState(() => error = 'Could not sign in with those credentials');
//
//                    }else{
//                      print('registeration succesfull');
//                      //print("$result");
//                      //Navigator.pushNamed(context, Home.id);
//                    }

                }
                //print(email);
                // print(password);
              },
            ),
          ],
        ),
      ),
    )
    );
  }
}
