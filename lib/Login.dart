import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:firebase_auth/firebase_auth.dart';

import './home/Dashboard.dart';
import 'Authenticate.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
//  final isloggedIn;
//  Login(this.isloggedIn);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authenticate = new Authenticate();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if (isloggedIn != null) {
    //   return Dahboard();
    // } else {
    // passwordError(BuildContext context) {
    // AlertDialog alert = AlertDialog(
    //   title: Text("Alert"),
    //   content: Text("Wrong password or user not found"),
    //   actions: [
    //     FlatButton(
    //         onPressed: () {
    //           Navigator.of(context, rootNavigator: true).pop();
    //         },
    //         child: Text('Ok'))
    //   ],
    // );

    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return alert;
    //       });
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome.."),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'asset/bmsce.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'LOG IN',
                  style: TextStyle(fontSize: 25, color: Colors.redAccent),
                )
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
              controller: emailController,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                ButtonTheme(
                  height: 50,
                  disabledColor: Colors.blueAccent,
                  child: RaisedButton(
                    disabledElevation: 4.0,
                    onPressed: () {
                      authenticate.signin(
                          emailController.text, passwordController.text);
                      FirebaseAuth.instance
                          .authStateChanges()
                          .listen((User user) {
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        } else {
                          // passwordError(context);
                        }
                      });
                    },
                    child: Text('LOGIN',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: Text('New Student? Sign Up here'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
    //  }
  }
}
