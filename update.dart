import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:fluttershare/widgets/header.dart';

class UpdateDataFromFireStore extends StatefulWidget {
  @override
  _UpdateDataFromFireStoreState createState() =>
      _UpdateDataFromFireStoreState();
}

class _UpdateDataFromFireStoreState extends State<UpdateDataFromFireStore> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  DocumentSnapshot _currentDocument;
  DocumentSnapshot _currentDocument1;
  DocumentSnapshot _currentDocument2;

  _updateData() async {
    await db
        .collection('tickets').document(currentUser.id).collection('data')
        .document(_currentDocument.documentID)
        .updateData({'Form': _controller.text});

  }
  _updateData1() async {
    await db
        .collection('tickets').document(currentUser.id).collection('data')
        .document(_currentDocument1.documentID)
        .updateData({'To': _controller1.text});
  }
  _updateData2() async {
    await db
        .collection('tickets').document(currentUser.id).collection('data')
        .document(_currentDocument2.documentID)
        .updateData({'Data': _controller2.text});
  }

  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,titleText: 'Update Ticket'),
      //AppBar(title: Text("Update Data from Firestore")),
      body: Scrollbar(
        //padding: EdgeInsets.all(12.0),
        child:ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
               padding: EdgeInsets.all(5.0),
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                          width: 150.0,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(hintText: 'Form'),
                          ),
                        )
                        ,
                        RaisedButton(
                            child: Text('Update'),
                            color: Colors.red,
                            onPressed: (){
                              _updateData();
                              _controller.clear();

                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Edit Successful'),
                                duration: Duration(seconds: 3),
                              ));
                            }
                        ),
                      ],
                    ),

                    ),
              StreamBuilder<QuerySnapshot>(
                      stream: db.collection('tickets').document(currentUser.id).collection('data').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data.documents.map((doc) {
                              return ListTile(
                                title: Text(doc.data['Form'] ?? 'nil'),
                                trailing: RaisedButton(
                                  child: Text("Edit Form"),
                                  color: Colors.blue,
                                  onPressed: () async {
                                    setState(() {
                                      _currentDocument = doc;
                                      _controller.text = doc.data['Form'];
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text('Edit Successful'),
                                        duration: Duration(seconds: 3),
                                      ));
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
              Divider(color: Colors.black,height: 5.0,thickness: 5.0,),
              Padding(
                padding: EdgeInsets.all(5.0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      width: 150.0,
                      child: TextField(
                        controller: _controller1,
                        decoration: InputDecoration(hintText: 'To'),
                      ),
                    )
                    ,
                    RaisedButton(
                        child: Text('Update'),
                        color: Colors.red,
                        onPressed: (){
                          _updateData1();
                          _controller1.clear();

                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Edit Successful'),
                            duration: Duration(seconds: 3),
                          ));
                        }
                    ),
                  ],
                ),

              ),
              StreamBuilder<QuerySnapshot>(
                  stream: db.collection('tickets').document(currentUser.id).collection('data').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.documents.map((doc) {
                          return ListTile(
                            title: Text(doc.data['To'] ?? 'nil'),
                            trailing: RaisedButton(
                              child: Text("Edit To"),
                              color: Colors.blue,
                              onPressed: () async {
                                setState(() {
                                  _currentDocument1 = doc;
                                  _controller1.text = doc.data['To'];
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Edit Successful'),
                                    duration: Duration(seconds: 3),
                                  ));
                                });
                              },
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              Divider(color: Colors.black,height: 5.0,thickness: 5.0,),
              Padding(
                padding: EdgeInsets.all(5.0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      width: 150.0,
                      child: TextField(
                        controller: _controller2,
                        decoration: InputDecoration(hintText: 'Data'),
                      ),
                    )
                    ,
                    RaisedButton(
                        child: Text('Update'),
                        color: Colors.red,
                        onPressed: (){
                          _updateData2();
                          _controller2.clear();

                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Edit Successful'),
                            duration: Duration(seconds: 3),
                          ));
                        }
                    ),
                  ],
                ),

              ),
              StreamBuilder<QuerySnapshot>(
                  stream: db.collection('tickets').document(currentUser.id).collection('data').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.documents.map((doc) {
                          return ListTile(
                            title: Text(doc.data['Data'] ?? 'nil'),
                            trailing: RaisedButton(
                              child: Text("Edit Date"),
                              color: Colors.blue,
                              onPressed: () async {
                                setState(() {
                                  _currentDocument2 = doc;
                                  _controller2.text = doc.data['Data'];

                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Edit Successful'),
                                    duration: Duration(seconds: 3),
                                  ));
                                });
                              },
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              Divider(color: Colors.black,height: 5.0,thickness: 5.0,),
              Divider(height: 50.0,)
            ],
          ),
        ],
        )
      ),
    );
  }
}