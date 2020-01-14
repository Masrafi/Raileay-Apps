import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:fluttershare/widgets/header.dart';



class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
//notification
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initSettings = InitializationSettings(android,ios);
    flutterLocalNotificationsPlugin.initialize(initSettings,onSelectNotification: onSelectNotification);
  }
  Future onSelectNotification(String payload){
    debugPrint("payload : $payload");
    showDialog(context: context,builder: (_)=>new AlertDialog(
      title: new Text('Notification'),
      content: new Text('payload'),
    ));
  }
  showNotification() async{
    var android = new AndroidNotificationDetails('channel id','channel NAME','CHANNEL DESCRIPTION');
    var ios = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.show(0, 'Successful', 'Welcome in Bangladesh Railway', platform);
  }//notification

  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();
  String username;
  String userphone;
  submit(){
    _formKey.currentState.save();
    Navigator.pop(context,username);
    Navigator.pop(context,userphone);

    showNotification();
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      appBar: header(context,titleText: 'Setup Your Profile'),
      body: WillPopScope(
        onWillPop: ()async{
          Future.value(false);
        },
        child:Container(
          child: Column(
           children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Text(
                    'Create Your Username',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Form(
                    key: _formKey,
                    autovalidate: true,
                     child:Column(
                       children: <Widget>[
                        TextFormField(
                           validator: (val) {
                             if (val.isEmpty) {
                               return 'Email Address is Empty';
                             } else {

                             }
                           },
                           onSaved: (val)=> username = val,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(),
                             labelText: 'Username',
                             hintText: 'Username',
                             labelStyle: TextStyle(fontSize: 15.0),
                           ),
                         ),
                         TextFormField(
                           keyboardType: TextInputType.number,
                           validator: (val) {
                             if (val.isEmpty) {
                               return 'Phone Number is Empty';
                             } else if(val.trim().length < 11) {
                               return 'You pree less then 11 numbers';
                             }else  if(val.trim().length>11){
                               return 'You press more 11 numbers';
                             }else{

                             }
                           },
                           onSaved: (val)=> userphone = val,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(),
                             labelText: 'Phone',
                             hintText: 'Phone Number',
                             labelStyle: TextStyle(fontSize: 15.0),
                           ),
                         ),
                       ],
                     )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    submit();
                  }
                },
                child: Container(
                  height: 50.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
