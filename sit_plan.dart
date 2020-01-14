import 'package:flutter/material.dart';
import 'package:fluttershare/pages/home2.dart';
import 'package:fluttershare/widgets/header.dart';
import 'home2.dart';

/*class Sit extends StatelessWidget {
  final User1 value;
  Sit({Key key, this.value,}):super(key:key);
  final _scaffold= GlobalKey<ScaffoldState>();

  createTicketInFireStore({String mediaUrl, String from1, String to1, String date1, String sitType, String sitNumber, String pass}){
    ticketRef.document(currentUser.id)
        .collection('userticket')
        .document()
        .setData({
      'From':from1,
      'To':to1,
      'Date':date1,
      'Sit Type': sitType,
      'Sit Number': sitNumber,
      'Passanger': pass
    });
}

  submit()async{
    setState(() {
      isUploading = true;
    });
    createTicketInFireStore(
      from1: value.from,
      to1: value.to,
      date1: value.date,
      sitType: value.class1,
      sitNumber: value.class1,
      pass: value.child
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,titleText: 'Sit Details'),
      body:  ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Row(
            children: <Widget>[
              Expanded(child: Image.asset(
                'assets/images/sit.jpg',
                fit:BoxFit.fitHeight,
                height: 250.0,
                width: 80.0,
              ),),
               Divider(),
               Icon(Icons.compare_arrows,size: 50.0,),
               Expanded(child:Image.asset(
                 'assets/images/sit1.jpg',
                 fit:BoxFit.fitHeight,
                 height: 250.0,
                 width: 80.0,
               ) ,)

            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                'Route From: ${value.from}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Route To: ${value.to}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Date: ${value.date}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Sit Type: ${value.class1}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Passenger Number: ${value.child}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Child Number: ${value.sit}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.end,

            children: <Widget>[
              GestureDetector(
                onTap: (){
                  submit();

                 Navigator.pop(context);
                },
                child: Container(
                  width: 360.0,
                  height: 50.0,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Confarm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        fontFamily: 'Signatra'
                      ),
                    ),
                  ),
                ),
              )
            ],
          ) ,
        ],
      ),
    );
  }
}
*/

class Sit extends StatefulWidget {


  final User1 value;
  Sit({Key key,@required  this.value}) : super(key:key);
  @override
  _SitState createState() => _SitState(value);
}


class _SitState extends State<Sit> {
 User1 value;
 _SitState(this.value);
  final _scaffold= GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,titleText: 'Sit Details'),
      body:  ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Row(
            children: <Widget>[
              Expanded(child: Image.asset(
                'assets/images/sit.jpg',
                fit:BoxFit.fitHeight,
                height: 250.0,
                width: 80.0,
              ),),
              Divider(),
              Icon(Icons.compare_arrows,size: 50.0,),
              Expanded(child:Image.asset(
                'assets/images/sit1.jpg',
                fit:BoxFit.fitHeight,
                height: 250.0,
                width: 80.0,
              ) ,)

            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                'Route From: ${value.from}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Route To: ${value.to}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Date: ${value.date}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Sit Type: ${value.class1}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Passenger Number: ${value.child}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
              Text(
                'Child Number: ${value.sit}',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: <Widget>[
              GestureDetector(
                onTap: (){

                  Navigator.pop(context);
                },
                child: Container(
                  width: 360.0,
                  height: 50.0,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Confarm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signatra'
                      ),
                    ),
                  ),
                ),
              )
            ],
          ) ,
        ],
      ),
    );
  }
}
