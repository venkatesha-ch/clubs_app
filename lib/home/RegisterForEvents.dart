import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testin_fire/home/Data.dart';

int flag = 0;
List list1 = [];

class RegisterForEvents extends StatefulWidget {
  // final List events;
  final String clubName;
  RegisterForEvents(this.clubName);

  @override
  _RegisterForEventsState createState() => _RegisterForEventsState();
}

class _RegisterForEventsState extends State<RegisterForEvents> {
  List list = [];
  CollectionReference data;

  @override
  Widget build(BuildContext context) {
    data = FirebaseFirestore.instance.collection(widget.clubName);

    data.snapshots().listen((snapshot) {
      setState(() {
        list = snapshot.docs;
      });
    });

    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text(
            'Register',
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'Register for upcoming events',
              style: TextStyle(fontSize: 25, color: Colors.red),
            )),
            SizedBox(
              height: 40,
            ),
            ...list.map((item) {
              return Container(
                height: 80,
                padding: EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      showAlertDialog(context, item['event']);
                    },
                    child: Text(
                      item['event'],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              );
            })
          ],
        ));
  }

  showAlertDialog(BuildContext context, String event) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
        child: Text("Yes"),
        onPressed: () async {
          try {
            Navigator.of(context, rootNavigator: true).pop();

            Map<String, dynamic> data = {"email": Data.email, "event": event};
            CollectionReference registerEvent = FirebaseFirestore.instance
                .collection('events_${widget.clubName}');
            registerEvent.snapshots().listen((snapshot) {
              list1 = snapshot.docs;
            });
            list1.map((items) {
              if (items['email'] == Data.email && items['event'] == event) {
                alreadyRegisterd(context);
                flag = 1;
              }
            });
            if (flag == 0) {
              registerEvent.add(data);
              confirmationSuccess(context);
            }
          } catch (e) {
            Navigator.of(context, rootNavigator: true).pop();

            confirmationError(context);
          }
        }); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Would you like to register for this event..?"),
      actions: [cancelButton, continueButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  confirmationError(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Some internal error occured"),
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

  alreadyRegisterd(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Registered"),
      content: Text("Alredy registerd"),
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

  confirmationSuccess(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Success"),
      content: Text("Registration completed"),
      actions: [
        FlatButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Text('Ok'))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
