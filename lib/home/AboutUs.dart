import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  final String des;
  Aboutus(this.des);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: ListView(
        children: [
          Text(
            'About Us ',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              des,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
