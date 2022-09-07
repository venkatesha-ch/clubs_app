import 'package:flutter/material.dart';

import 'ClubPage.dart';

class ClubContainer extends StatelessWidget {
  final String clubName;
  final String clubDes;
  ClubContainer(this.clubName, this.clubDes);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClubPage(clubName, clubDes)));
      },
      child: Card(
          color: Colors.yellow[200],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    clubName,
                    style: TextStyle(fontSize: 24, color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    clubDes,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
