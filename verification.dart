import 'package:flutter/material.dart';
import 'package:fluttershare/pages/home2.dart';
import 'package:fluttershare/widgets/header.dart';


class Verifi extends StatefulWidget {
  @override
  _VerifiState createState() => _VerifiState();
}

class _VerifiState extends State<Verifi> {
  String _value;
  String _firstName;
  var _royFromController = new TextEditingController();
  var _roytoController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,titleText: 'Verify Ticket'),
      body:

      Scrollbar(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                key: _formKey,
                children: <Widget>[
                  Divider(),
                  DropdownButton<String>(
                    isExpanded: true,

                    items: [
                      DropdownMenuItem<String>(
                        value: 'Online Printed',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar),
                              tooltip: 'Previous Page',
                              onPressed: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Counter()));
                              },
                            ),
                            Text('OnLine Ticket'),

                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Counter Printed',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.account_balance),
                              tooltip: 'Previous Page',
                              onPressed: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Counter()));
                              },
                            ),
                            Text('Counter Ticket')
                          ],
                        ),
                      ),
                    ],
                    onChanged: (String value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    hint: Text('Select Sit Type'),
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    value: _value,
                  ),
                  Divider(),
                  Text(
                    'Pin',
                    textAlign: TextAlign.left,
                  ),
                  TextFormField(
                    autovalidate: true,
                    keyboardType: TextInputType.text,
                     controller: _royFromController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Text Field is Empty';
                      } else {

                      }
                    },
                    decoration: InputDecoration(
                      // icon: Icon(Icons.location_on),
                        border: OutlineInputBorder(),
                        labelText: 'PIN',
                        // icon: Icon(Icons.location_on),
                        hintText: 'Pin Number',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        )
                    ),
                  ),
                  Divider(),
                  Text(
                    'Mobile',
                    textAlign: TextAlign.left,
                  ),
                  TextFormField(
                    autovalidate: true,
                    keyboardType: TextInputType.text,
                     controller: _roytoController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Test Field is Empty';
                      } else {

                      }
                    },
                    decoration: InputDecoration(
                      // icon: Icon(Icons.location_on),
                        border: OutlineInputBorder(),
                        labelText: 'MOBILE',
                        // icon: Icon(Icons.location_on),
                        hintText: 'Mobile Number',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        )
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: (){
                         if (_formKey.currentState.validate()) {

                         }
                    },
                    child: Container(
                      width: 400.0,
                      height: 50.0,
                      color: Colors.black,
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: const
                        Text('Verifi',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Signatra')),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


