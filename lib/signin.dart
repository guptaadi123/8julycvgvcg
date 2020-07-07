import 'package:finalproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'register.dart';
import 'forgotpass.dart';


class Signin extends StatefulWidget {
  static const String id = 'Signin';
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              Navigator.pushNamed(context, Register.id);
            },
          )
        ],
        title: Text('Signin page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.isEmpty? 'Enter an email' : null,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (val) {
                  setState(() => email = val );



                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chrs long' : null,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val );

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                    //print(name);
                    //print(name);
                    //print(email);
                    //print(password);
                    if(result==null){
                      setState(() => error = 'Could not sign in with those credentials');

                    }else{
                      print('registeration succesfull');
                      //print("$result");
                      Navigator.pushNamed(context, Home.id);
                    }

                  }
                  //print(email);
                  // print(password);

                },
              ),
              SizedBox(height: 12.0,),
              FlatButton(
                color: Colors.pink,
                child: Text(
                    "Forgot Password", style: TextStyle(
                  color: Colors.white,
                ),),
                onPressed: (){
                  Navigator.pushNamed(context, Forgot.id);

                },
              ),
              SizedBox(height: 12.0,),
              Text(error,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0
                ),),

            ],
          ),
        ),
      ),
    );
  }
}