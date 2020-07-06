import 'package:flutter/material.dart';
import 'package:finalproject/services/auth.dart';
import 'signin.dart';
import 'home.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        title: Text('Register page'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              Navigator.pushNamed(context, Signin.id);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'name'),
                validator: (val) => val.isEmpty ? 'Enter an name' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (val) => val.isEmpty? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                keyboardType: TextInputType.emailAddress,

              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'password'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chrs long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.pink,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    //print(name);
                   //print(name);
                    //print(email);
                    //print(password);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password,name);
                    if(result==null){
                      setState(() => error = 'pleasse supply a valid email');

                    }else{
                      print('registeration succesfull');
                      Navigator.pushNamed(context, Home.id);
                    }

                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(error,
                  style: TextStyle(
                color: Colors.red,
                      fontSize: 14.0
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
