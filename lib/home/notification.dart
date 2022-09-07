import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationMenu extends StatefulWidget {
  final String clubName;
  NotificationMenu(this.clubName);
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationMenu> {
  List list = [];
  CollectionReference notifications =
      FirebaseFirestore.instance.collection('notifications');
  @override
  Widget build(BuildContext context) {
    notifications.snapshots().listen((snapshot) {
      setState(() {
        list = snapshot.docs;
      });
    });
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          ...list.map((element) {
            return Text(element['notification']);
          }).toList(),
        ],
      ),
    );
  }
}
