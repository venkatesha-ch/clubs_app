import 'package:flutter/material.dart';

import 'RegisterForEvents.dart';

int flag = 0;

class RegisterPage extends StatefulWidget {
  final String clubName;
  RegisterPage(this.clubName);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // List _list = [];

  @override
  Widget build(BuildContext context) {
    return RegisterForEvents(widget.clubName);
  }
}
