import 'package:flutter/material.dart';
import 'package:testin_fire/home/AboutUs.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:testin_fire/home/Data.dart';
import 'package:testin_fire/home/RegisterForEvents.dart';
import 'package:testin_fire/home/Upcoming.dart';

class ClubPage extends StatefulWidget {
  final String clubName;
  final String clubDes;
  ClubPage(this.clubName, this.clubDes);

  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  String register = 'Register for events';

  @override
  Widget build(BuildContext context) {
    var email = Data.email;
    bool emailValid = RegExp(r'^.+@bmsce.ac.in$').hasMatch(email);
    print(emailValid);
    if (!emailValid) {
      register = 'Registration closed for outsiders';
    }
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(widget.clubName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text('Welcome to ${widget.clubName}',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            color: Colors.yellow,
            child: FlatButton(
              onPressed: () {
                if (register == 'Register for events') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterForEvents(widget.clubName)));
                }
              },
              child: Text(
                '$register',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                  color: Colors.red[400],
                  padding: EdgeInsets.all(10),
                  height: 400,
                  child: Upcoming(widget.clubName)),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.yellow,
                padding: EdgeInsets.all(10),
                height: 400,
                child: Aboutus(widget.clubDes),
              )
            ],
          ),
          SizedBox(height: 20),
           Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Contact us',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
          Row(
            children: [
               FlatButton(
                  onPressed: () => launch('tel:7560825744'),
                  child: Icon(
                    Icons.phone,
                    color: Colors.blue[900],
                    size:40
                  )),
          
               FlatButton(
                  onPressed: () => launch('mailto:${widget.clubName}@bmsce.ac.in'),
                  child: Icon(
                    Icons.mail,
                    color: Colors.blue[900],
                    size:40
                  )) 
            ],
          )
        ],
      ),
    );
  }
}
