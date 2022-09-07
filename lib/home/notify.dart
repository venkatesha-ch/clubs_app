import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetData {
  final String docName;
  GetData(this.docName);

  List list = [];
}

class Notify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('clubs');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading....");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['clubname']),
            );
          }).toList(),
        );
      },
    );
//     return Container(
//       width: double.infinity,
//       height: 100,
//       padding: EdgeInsets.all(20),
//       child: ListView(
//         children: [
//           ...list.map((element) {
//             return Text(element['notification']);
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }

// class DrawerDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               child: Text('Dashboard'),
//             ),
//             ListTile(
//               title: Text('item 1'),
//               onTap: () => print('item1'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
  }
}
