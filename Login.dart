import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttershare/pages/components/MessageSnack.dart';
import 'package:fluttershare/pages/services/auth.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'Home.dart';


enum FormType { LOGIN, REGISTER }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // state variables
  String _email, _password, _firstName, _lastName;
  String _pageTitle = "Account Login";
  FormType _formType = FormType.LOGIN;
  bool _loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit(BuildContext context) async {
    if (validate()) {
      try {
        setState(() {
          _loading = true;
        });
        //final auth = Provider.of(context).auth;
        if (_formType == FormType.LOGIN) {
          // Login user using firebase API
          await AuthService().loginUser(email: _email, password: _password);
          showNotification();
        } else {
          // Create New User user using firebase API
          await AuthService().createUser(
              email: _email,
              firstName: _firstName,
              lastName: _lastName,
              password: _password,


             // phone: _phoneNumber
          );
          showNotification1();
        }

        setState(() {
          _loading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: "HomePage"),
              builder: (BuildContext context) => HomePage()),
        );
      } catch (e) {
        MessageSnack().showErrorMessage(
            e,
            _scaffoldKey,
            () => {
                  setState(() {
                    _loading = false;
                  })
                });
      } finally {}
    }
  }

  void switchFormState(String state) {
    formKey.currentState.reset();

    if (state == 'register') {
      setState(() {
        _formType = FormType.REGISTER;
        _pageTitle = 'Account Registration';
      });
    } else {
      setState(() {
        _formType = FormType.LOGIN;
        header(context,titleText: 'Login Regidy=tration');
       // _pageTitle = 'Account Login';
      });
    }
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool noti;
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
    await flutterLocalNotificationsPlugin.show(0, 'Successfully LogIn', 'Welcome in Bangladesh Railway', platform);
  }
  showNotification1() async{
    var android = new AndroidNotificationDetails('channel id','channel NAME','CHANNEL DESCRIPTION');
    var ios = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.show(0, 'Successfully Account Registration', 'Welcome in Bangladesh Railway', platform);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: header(context,titleText: 'Login Registration'),
      body: ModalProgressHUD(
                child: Center(
                  child:
                     Form(
                      key: formKey,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: buildInputs(_formType) +
                              [
                                Padding(
                                    padding:
                                    EdgeInsets.only(left: 20, right: 20, top: 5),
                                    child: Column(children: buildButtons(context))),
                              ],
                        ),
                      ),
                    ),
                ),
                inAsyncCall: _loading),
    );
  }

  List<Widget> buildInputs(FormType formType) {
    var base = <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Email',icon: Icon(Icons.email)),
        onSaved: (value) => _email = value,

      ),
      TextFormField(
        //validator: PasswordValidator.validate,
        decoration: InputDecoration(labelText: 'Password', icon: Icon(Icons.keyboard)),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    ];

    if (formType == FormType.REGISTER) {
      return base +
        <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Full Name',icon: Icon(Icons.person)),
        onSaved: (value) => _firstName = value,
      ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Phone Number', icon: Icon(Icons.phone_in_talk)),
    onSaved: (value) => _lastName = value,
    ),

   /* TextFormField(
    decoration: InputDecoration(labelText: 'Phone Number',icon: Icon(Icons.phone_in_talk)),
    onSaved: (value) => _phoneNumber = value,
    ),*/
    ];

    } else {
      return base;
    }
  }

  List<Widget> buildButtons(BuildContext context) {
    if (_formType == FormType.LOGIN) {
      return [
        RaisedButton(
          key: new Key('login'),
          child: Align(alignment: Alignment.center, child: Text('Login')),
          onPressed: () {
            submit(context);


          },
        ),
        RaisedButton(
          key: new Key('goto-register'),
          child: Align(
              alignment: Alignment.center, child: Text('Register Account')),
          onPressed: () {
            switchFormState('register');
          },
        ),
      ];
    } else {
      return [
        RaisedButton(
          key: new Key('create-account'),
          child:
              Align(alignment: Alignment.center, child: Text('Create Account')),
          onPressed: (){
            submit(context);
          }

        ),
        RaisedButton(
          key: new Key('go-back'),
          child: Align(alignment: Alignment.center, child: Text('Back')),
          onPressed: () {
            switchFormState('login');
          },
        )
      ];
    }
  }
}
