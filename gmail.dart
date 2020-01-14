import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/verification.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttershare/pages/account_name.dart';
import 'package:uuid/uuid.dart';
import 'home.dart';

String postId = Uuid().v4();
final GoogleSignIn googleSignIn = GoogleSignIn();
final userRef = Firestore.instance.collection('users');
final ticketRef = Firestore.instance.collection('tickets');
final DateTime timestamp = DateTime.now();
User currentUser;



class Home1 extends StatefulWidget {

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  Future<QuerySnapshot>searchFutureResult;
  handleSearch(String query){
    Future<QuerySnapshot>users =
    userRef.where('displayName',isGreaterThanOrEqualTo: query).getDocuments();
    setState(() {
      searchFutureResult = users;
    });
  }

  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState(){
    super.initState();
    pageController = PageController();

    googleSignIn.onCurrentUserChanged.listen((account){
      handleSignIn(account);
    },onError: (err){
      print('Error User SignIn : $err');
    });

    googleSignIn.signInSilently(suppressErrors: false)
        .then((account){
      handleSignIn(account);
    }).catchError((err){
      print('Error User SignIn : $err');
    });
  }
  handleSignIn(GoogleSignInAccount account){
    if(account != null){
      createUserFirestore();
      setState(() {
        isAuth = true;
      });
    }else{
      setState(() {
        isAuth = false;
      });
    }
  }
  createUserFirestore() async{
      GoogleSignInAccount user = googleSignIn.currentUser;
      DocumentSnapshot doc = await userRef.document(user.id).get();
    if(!doc.exists){
      final username = await Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
      final userphone = await Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));

      userRef.document(user.id).setData({
        'id':user.id,
        'email':user.email,
        'username':username,
        'userphone':userphone,
        'displayName':user.displayName,
        'photoUrl':user.photoUrl,
        'bio':'Safe travel is our promise- Bangladesh Railway',
        'timestamp':timestamp,

      });
      doc = await userRef.document(user.id).get();
    }
   currentUser = User.fromDocument(doc);
    print(currentUser);
   // print(currentUser.username);
    //print(currentUser.displayName);
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex){
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  login(){
    googleSignIn.signIn();
  }

  logout(){
    googleSignIn.signOut();
  }

  Scaffold buildAuthScreen(){
    return Scaffold(
      body: Home(),
    );
  }

  Scaffold buildUnAuthScreen(){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellowAccent,
              Colors.red,
              Colors.teal
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'RailWay App',
              style: TextStyle(
                fontSize: 90.0,
                fontFamily: 'Signatra',
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                width: 260.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_button.png'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}


