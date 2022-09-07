import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Upcoming extends StatefulWidget {
  final String clubName;
  Upcoming(this.clubName);
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    CollectionReference upcoming =
        FirebaseFirestore.instance.collection(widget.clubName);
    upcoming.snapshots().listen((snapshot) {
      setState(() {
        list = snapshot.docs;
      });
    });
    return Container(
      width: 180,
      child: ListView(
        children: [
          Text(
            'Upcoming ',
            style: TextStyle(fontSize: 25, color: Colors.yellow),
          ),
          SizedBox(
            height: 20,
          ),
          ...list.map((item) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Text(
                item['event'],
                style: TextStyle(fontSize: 20),
              ),
            );
          })
        ],
      ),
    );
  }
}
