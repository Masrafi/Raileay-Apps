import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:fluttershare/pages/second.dart';
import 'package:fluttershare/widgets/header.dart';

class DeleteDataFromFireStore extends StatelessWidget {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return
      //MaterialApp(
      //home:
      Scaffold(
          appBar: header(context,titleText: 'Cancel Ticket'),
          //AppBar(title: Text("Delete Data from Firestore")),
          body:
          Column(
            //padding: EdgeInsets.all(12.0),
            children: <Widget>[
              SizedBox(height: 20.0),
              StreamBuilder<QuerySnapshot>(
                  stream: db.collection('tickets').document(currentUser.id).collection('data').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.documents.map((doc) {
                          return ListTile(
                            title: Text(doc.data['ID']),
                            trailing: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () async {
                                await db
                                    .collection('tickets').document(currentUser.id).collection('data').document(doc.documentID).delete();
                                //Navigator.pop(context);
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Delete Successful'),
                                  duration: Duration(seconds: 3),
                                ));
                              },
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),

      //),

    );
  }
}