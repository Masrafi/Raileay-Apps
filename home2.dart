import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/sit_plan.dart';
import 'package:uuid/uuid.dart';

import 'gmail.dart';

class User1{
  final String sit;
  final String from;
  final String to;
  final dynamic date;
  final String class1;
  final String child;
  const User1({
    this.sit,
    this.from,
    this.to,
    this.date,
    this.class1,
    this.child
});
}

class Home2 extends StatefulWidget {
 final User currentUser;
  Home2({
    this.currentUser
});
  @override
  _Home2State createState() => _Home2State();
}


class _Home2State extends State<Home2> {

  var _sitController = new TextEditingController();
  var _royFromController = new TextEditingController();
  var _rotToController = new TextEditingController();
  var _datController = new TextEditingController();
  var _clsController = new TextEditingController();
  var _pasController = new TextEditingController();
  var _rentController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();
  //String username;
  String _value;
  String _valueT;
  String _valueSit;
  DateTime _dateTime;


  bool isUploading = false;
  String postId = Uuid().v4();
  createPostInFireStore({String from1, String to1, String date1, String sitType, String sitNum, String pass,String train,String rent}){
    ticketRef.document(currentUser.id).collection('data').
    document(postId)
        .setData({
      //'ownerId':widget.currentUser.id,
      'username':currentUser.displayName,
      'Form':from1,
      'To':to1,
      'Data': date1,
      'SitType': sitType,
      'SitNumber': sitNum,
      'PassangerType': pass,
      'Time': timestamp,
      'ID': currentUser.id,
      'TrainName': train,
      "Rent": rent

    });
    _royFromController.clear();
    _rotToController.clear();
    _pasController.clear();

  }


  submit()async{
    setState(() {
      isUploading = true;
    });
    createPostInFireStore(
      from1: _royFromController.text,
      to1: _rotToController.text,
      date1: _dateTime.toString(),
      sitType: _value,
      sitNum: _valueSit,
      pass: _pasController.text,
        train: _valueT,
        rent: _rentController.text
    );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Scrollbar(
              child: ListView(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                          children: <Widget>[


                            DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                //color: Colors.black,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.horizontal(),
                                    border: Border.all(color: Colors.yellowAccent, width: 5.0)
                                ),
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text('Rongpur Express'),
                                  value: 'Rongpur Express',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Lalmoni Express'),
                                  value: 'Lalmoni Express',
                                ),

                              ],
                              onChanged: (String value) {
                                setState(() {
                                  _valueT = value;
                                });
                              },
                              hint: Text('Select Sit Type'),
                              value: _valueT,

                            ),



                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _royFromController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'User name is too short';
                                } else {

                                }
                              },
                              decoration: InputDecoration(
                                // icon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(),
                                  labelText: 'Route From',
                                  // icon: Icon(Icons.location_on),
                                  hintText: 'FROM',
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                            Divider(),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _rotToController,

                              validator: (value1) {
                                if (value1.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                  ), labelText: 'Route To',
                                  hintText: 'TO',
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                            Divider(),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(_dateTime == null ? 'Empty' : _dateTime.toString()),
                                RaisedButton(
                                  child: Text('Pick a date'),
                                  onPressed: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                                        firstDate: DateTime(2001),
                                        lastDate: DateTime(2021)
                                    ).then((date) {
                                      setState(() {
                                        _dateTime = date;
                                      });
                                    });
                                  },
                                )
                              ],
                            ),


                            Divider(thickness: 1.0,color: Colors.black),

                            DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                //color: Colors.black,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.horizontal(),
                                    border: Border.all(color: Colors.yellowAccent, width: 5.0)
                                ),
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text('Item 1: Chair'),
                                  value: 'Chair',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Item 2: AC'),
                                  value: 'AC',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Item 3: Caben'),
                                  value: 'Caben',
                                ),
                              ],
                              onChanged: (String value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                              hint: Text('Select Sit Type'),
                              value: _value,

                            ),


                            Divider(thickness: 1.0,color: Colors.red),

                            DropdownButton<String>(
                              // key: _formKey,
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                //color: Colors.black,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(11.0),
                                    border: Border.all(color: Colors.yellowAccent, width: 5.0)
                                ),
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text('1'),
                                  value: '1',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('2'),
                                  value: '2',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('3'),
                                  value: '3',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('4'),
                                  value: '4',
                                ),
                              ],
                              onChanged: (String value) {
                                setState(() {
                                    _valueSit = value;

                                });
                              },
                              hint: Text('Sit Number'),
                              value: _valueSit,

                            ),
                          //  Divider(thickness: 1.0,color: Colors.black),

                            Text(
                              '*Maximum 4 seats can be issued.', style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),),
                            Divider(),
                            TextFormField(
                              controller: _pasController,

                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Passenger',
                                  hintText: 'Child',
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _rentController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Pay Rent';
                                }
                              },

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Rent',
                                  hintText: 'Rent',
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                  Divider(),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                      child:RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.


                            var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                new Sit(
                                    value: User1(
                                      sit: _pasController.text,
                                      from: _royFromController.text,
                                      to: _rotToController.text,
                                      date: _dateTime,
                                      class1: _value,
                                      child: _valueSit,

                                    )
                                ),

                            );
                            submit();
                            Navigator.of(context).push(route);

                          }

                        },
                        child: Text(
                          'Find',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                      )
                  ),
                ],
              ),
            )
    );
  }
}
