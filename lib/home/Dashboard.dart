import 'package:flutter/material.dart';
import 'package:testin_fire/home/Club.dart';
import 'Data.dart';

import '../login.dart';
import '../Authenticate.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void _openDrawer() {
  _scaffoldKey.currentState.openDrawer();
}

class Dashboard extends StatelessWidget {
  final Authenticate authenticate = new Authenticate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.redAccent,
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Dashboard'),
              backgroundColor: Colors.black54,
              // actions: <Widget>[
              //   Padding(
              //       padding: EdgeInsets.only(right: 20.0),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 32,
                    ),
                    onPressed: () {
                      _openDrawer();
                    },
                  );
                },
              ),
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors
                    .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
              ),
              child: Container(
                width: 250,
                child: Drawer(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // ignore: missing_required_param
                        UserAccountsDrawerHeader(
                          currentAccountPicture: CircleAvatar(
                              backgroundImage: AssetImage('asset/img.png')),
                          accountName: Text(Data.email),
                          // accountEmail: Text(userEmail),
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                              color: Colors.redAccent,
                              child: Text('Sign out'),
                              onPressed: () {
                                authenticate.signOut();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            drawerEnableOpenDragGesture: false,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                          child: Text(
                            'BMSCE Clubs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Club(),
                  //Container(child: Notify())
                ])));
  }
}

//notification,
//clubs list,
//contact us
//       ],
//     ),
//   ),
// );
//   }
// }
