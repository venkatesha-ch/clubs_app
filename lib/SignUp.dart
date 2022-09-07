import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testin_fire/login.dart';

import 'Authenticate.dart';
import './home/Dashboard.dart';

final authenticate = new Authenticate();

class SignUp extends StatelessWidget {
  final emailController = TextEditingController();
  final retypeController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    passwordError(BuildContext context) {
      AlertDialog alert = AlertDialog(
        title: Text("Recheck password"),
        content: Text("Password does not match.."),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text('Ok'))
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
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
                  'SIGN UP',
                  style: TextStyle(fontSize: 25, color: Colors.redAccent),
                ),
                SizedBox(
                  height: 40.0,
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
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Re-type password",
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true,
                  ),
                  controller: retypeController,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    ButtonTheme(
                      height: 50,
                      disabledColor: Colors.blueAccent,
                      child: RaisedButton(
                        disabledElevation: 4.0,
                        onPressed: () {
                          if (passwordController.text !=
                              retypeController.text) {
                            passwordError(context);
                          } else {
                            authenticate.signup(
                                emailController.text, passwordController.text);
                            FirebaseAuth.instance
                                .authStateChanges()
                                .listen((User user) {
                              if (user != null)
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()));
                            });
                          }
                        },
                        child: Text('SIGNUP',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ButtonTheme(
                      height: 50,
                      disabledColor: Colors.blueAccent,
                      child: RaisedButton(
                        disabledElevation: 4.0,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text('Login insted',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        )));
  }
}
