import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testin_fire/home/ClubContainer.dart';

class Club extends StatefulWidget {
  @override
  _ClubState createState() => _ClubState();
}

class _ClubState extends State<Club> {
  List list = [];
  CollectionReference clubs = FirebaseFirestore.instance.collection('clubs');
  @override
  Widget build(BuildContext context) {
    clubs.snapshots().listen((snapshot) {
      setState(() {
        list = snapshot.docs;
      });
    });
    return Expanded(
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ...list.map(
              (item) => ClubContainer(item['clubname'], item['des']),
            )
          ]),
    );
  }
}
