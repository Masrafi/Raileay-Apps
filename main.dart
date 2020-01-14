import 'package:flutter/material.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text('Welcome In Bangladesh Railway',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                fontFamily: 'Signatra'
            ),
          ),
          image:Image.asset('assets/images/raill.jpg',height: 800.0,),
          gradientBackground: new LinearGradient(colors: [Colors.blue, Colors.brown], begin: Alignment.topLeft, end: Alignment.bottomRight),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 180.0,
          onClick: ()=>print("Flutter Egypt"),
          loaderColor: Colors.red,
        );



  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home1();
  }
}