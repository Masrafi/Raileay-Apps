import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';


class Regester extends StatefulWidget {
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,titleText: 'User Registration'),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:30.0,bottom: 5.0,left: 10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Form(
                  autovalidate: true,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Full Name',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        )
                    ),
                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top:5.0,bottom: 10.0,left: 10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Email Address',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Form(
                  autovalidate: true,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Email',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        )
                    ),
                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top:5.0,bottom: 10.0,left: 10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Mobile',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Form(
                  autovalidate: true,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '1XXXXXXXXX',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        )
                    ),
                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top:5.0,bottom: 10.0,left: 10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Confirm Mobile',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Form(
                  autovalidate: true,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Re-type mobile number',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        )
                    ),
                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top:5.0,bottom: 10.0,left: 10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Form(
                  autovalidate: true,
                  child: TextFormField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        )
                    ),
                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top:5.0,bottom: 10.0,left: 10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Form(
                  autovalidate: true,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Re-type password',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        )
                    ),
                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
