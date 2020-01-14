
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/components/MenuDrawer.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/pages/second.dart';
import 'package:fluttershare/pages/services/auth.dart';
import 'package:provider/provider.dart';
import 'Login.dart';


class ItemOwner {
  String email;
  String firstName;
  String lastName;
  String id;

  ItemOwner({this.email, this.firstName, this.lastName, this.id,});

  factory ItemOwner.fromSnap(DocumentSnapshot itemSnap) {
    return ItemOwner(
        email: itemSnap.data['email'],
        firstName: itemSnap.data['firstName'],
        lastName: itemSnap.data['lastName'],
        id: itemSnap.documentID ?? null);
  }
}

class HomePage extends StatefulWidget {
  final User currentUser;
  HomePage({this.currentUser});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("drawing Home Page");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile",style: TextStyle(fontSize: 50.0, fontFamily: 'Signatra',),)),
        actions: <Widget>[LogoutButton()],
      ),
      drawer: Drawer(
        child: FutureBuilder<FirebaseUser>(
            future: AuthService().getUser,
            builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Provider.of<MenuStateInfo>(context)
                    .setCurrentUser(snapshot.data);
                return MenuDrawer();
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      body: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 60.0,
                  //child: Icon(CupertinoIcons.person,size: 65.0,),
                  backgroundImage: NetworkImage(currentUser.photoUrl),
                ),
              ),

            ],
          ),
          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(currentUser.displayName,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              Text((currentUser.username),style: TextStyle(fontSize: 20.0),)
            ],
          ),
          Divider(),

          Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Expanded(
                child:  Column(
                  children: <Widget>[
                    Icon(Icons.home),
                    FlatButton(
                      child: Text('Home',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.receipt),
                    FlatButton(
                      child: Text('Ticket',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                      },
                    )
                  ],
                ),
              ),

            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[

                Icon(CupertinoIcons.profile_circled,size: 40.0,color: Colors.blue,),
                VerticalDivider(),
                Text(
                  'Intro',
                  style: TextStyle(
                      fontSize: 40.0
                  ),
                )
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(currentUser.bio,style: TextStyle(fontSize: 18.0),),
          )



        ],
      ),
    );
  }

  getDriversList() async {
    return await Firestore.instance.collection('users').getDocuments();
  }

//suru

  /*QuerySnapshot querySnapshot;
  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }
  Widget _showDrivers(){
    if(querySnapshot != null){
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12.0),
        itemBuilder: (context, i){
          return
            Column(
            children: <Widget>[
              Text(currentUser.username),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    //child: Icon(CupertinoIcons.person,size: 65.0,),
                    backgroundImage: NetworkImage('${querySnapshot.documents[i].data['photoUrl']}'),
                  ),
                ),

              ],
            ),
                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${querySnapshot.documents[i].data['displayName']}',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                      Text('(${querySnapshot.documents[i].data['username']})',style: TextStyle(fontSize: 20.0),)
                    ],
                  ),
              Divider(),

             Row(
               //mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[

                 Expanded(
                   child:  Column(
                     children: <Widget>[
                       Icon(Icons.home),
                       FlatButton(
                         child: Text('Home',
                           style: TextStyle(
                               fontSize: 20.0,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                         },
                       )
                     ],
                   ),
                 ),
                 Expanded(
                   child: Column(
                     children: <Widget>[
                       Icon(Icons.receipt),
                       FlatButton(
                         child: Text('Ticket',
                           style: TextStyle(
                               fontSize: 20.0,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                         },
                       )
                     ],
                   ),
                 ),

               ],
             ),
              Divider(),
              Row(
                children: <Widget>[
                  Icon(CupertinoIcons.profile_circled,size: 40.0,color: Colors.blue,),
                  VerticalDivider(),
                  Text(
                    'Intro',
                    style: TextStyle(
                      fontSize: 40.0
                    ),
                  )
                ],
              ),

              Text('${querySnapshot.documents[i].data['bio']}',style: TextStyle(fontSize: 18.0),)
          ],
          );
        },
      );
    }
    else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }*/

}
// ses akhne data get kra

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(Icons.exit_to_app),
        onPressed: () async {
          await AuthService().logout();

          // Navigator.pushReplacementNamed(context, "/");

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: "LoginPage"),
                builder: (BuildContext context) => LoginPage()),
          );
          Text('logout');
        });
  }
}
