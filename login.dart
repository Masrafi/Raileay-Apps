import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/screens/Home.dart';
import 'package:fluttershare/pages/screens/Login.dart';
import 'package:provider/provider.dart';
import './services/auth.dart';
import 'components/LoadingCircle.dart';
import 'components/MenuDrawer.dart';

//void main() => runApp(MyApp());

class Login extends StatelessWidget {
  // This widget is the root of your application.

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    print("drawing Main Page");

    FirebaseAnalytics analytics = FirebaseAnalytics();

    analytics.setCurrentScreen(screenName: "Main Screen").then((v) => {});

    return MultiProvider(
      providers: [
        Provider<FirebaseAnalytics>.value(value: analytics),
        Provider<MenuStateInfo>.value(
          value: MenuStateInfo("HomePage"),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        initialRoute: "/",
        home: FutureBuilder<FirebaseUser>(
            future: AuthService().getUser,
            builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print("drawing main: target screen" +
                    snapshot.connectionState.toString());
                final bool loggedIn = snapshot.hasData; 
                return loggedIn ? HomePage() : LoginPage();
              } else {
                print("drawing main: loading circle" +
                    snapshot.connectionState.toString());
                return LoadingCircle();
              }
            }),
      ),
    );
  }
}
