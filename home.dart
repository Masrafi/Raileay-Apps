import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/contact.dart';
import 'package:fluttershare/pages/first.dart';
import 'package:fluttershare/pages/gallery.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:fluttershare/pages/home2.dart';
import 'package:fluttershare/pages/location.dart';
import 'package:fluttershare/pages/second.dart';
import 'package:fluttershare/pages/verification.dart';
import 'package:fluttershare/models/user.dart';
import 'package:url_launcher/url_launcher.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  User currentUser;
  Widget popupMenueButton(){

    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, size: 28.0,),
      itemBuilder: (BuildContext context)=><PopupMenuEntry<String>>[

        PopupMenuItem<String>(
          value: 'three_val',
          child: Text('Train Distribution',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '',
          child: InkWell(
            child: Text(
                'East Zone',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.red,
                  fontWeight: FontWeight.bold,
                fontSize: 25.0
              ),
            ),
            onTap: _launchURLEast,
          ),
        ),
        PopupMenuItem<String>(
          value: '',
          child: InkWell(
            child: Text('West ZOne',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ),
            onTap: _launchURLWest,
          ),

        ),
        PopupMenuItem<String>(
          value: '',
          child: InkWell(
            child: Center(
              child: Text('Sign Out',
                style: TextStyle(
                    decoration: TextDecoration.underline,

                  fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            onTap: logout,
          ),

        ),


      ],
    );
  }

  _launchURL() async {
    const url = 'http://www.travelonebd.com/transportation/12-railway/18-bangladesh-railway-schedule';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLEast() async {
    const url = 'http://www.railway.gov.bd/site/page/6e031e11-f297-45c0-85bb-a7423d682e9c/East-Zone-Train-Schedule-';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLWest() async {
    const url = 'http://www.railway.gov.bd/site/page/edff5f17-5bf4-4dc3-94b5-d531ebda64b3/West-Zone-Train-Schedule-';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String PageEnum;
  logout(){
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          popupMenueButton(),
        ],
        title:
        Center(
          child:
          Center(
            child: Text(
              'Bangladesh Rail',
              style: TextStyle(
                fontFamily: 'Signatra',
                    fontSize: 50.0
              ),

            ),
          ),
        ),
        bottom: TabBar(
          tabs: <Widget>[

            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
           /* Tab(
              icon: Icon(Icons.assignment_ind,),
              text: 'Login',
            ),*/
          /*  Tab(
              icon: Icon(Icons.receipt),
              text: 'Register',
            ), */
            Tab(
              icon: Icon(Icons.verified_user),
              text: 'VerifyTicket',
            ),
            Tab(
              icon: Icon(Icons.contacts),
              text: 'Contact',
            ),
            Tab(
              icon: Icon(Icons.location_on),
              text: 'Location',
            ),
          ],
        ),
      ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                Image.asset('assets/images/line.jpg'),
                ListTile(
                  title: Text('Login Registration'),
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>First()));
                  },
                  leading: Icon(Icons.assignment_ind),
                ),
                ListTile(
                  title: Text('Ticket'),
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                  },
                  leading: Icon(Icons.panorama_vertical),
                ),
                ListTile(
                  title: Text('Gallery'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Mas()));
                  },
                  leading: Icon(Icons.image),
                ),
                ListTile(
                  title: Text('Schedule Details'),
                  onTap: (){
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>Four()));
                    _launchURL();
                  },
                  leading: Icon(Icons.palette),
                ),
                Divider(
                  height: 20.0,
                ),
                ListTile(
                  title: Text('close'),
                  trailing: Icon(Icons.close, color:Colors.red),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
      body: TabBarView(
          children: [
            Home2(),
           // Login(),
            //Regester(),
            Verifi(),
            Contact(),
            Location()
          ],
    )
      )
        );
  }
}





