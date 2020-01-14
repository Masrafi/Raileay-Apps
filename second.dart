import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/delete.dart';
import 'package:fluttershare/pages/gmail.dart';
import 'package:fluttershare/pages/update.dart';
import 'package:fluttershare/widgets/header.dart';


class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final db = Firestore.instance;

  getDriversList() async {
    return await Firestore.instance.collection('tickets').document(currentUser.id).collection('data').getDocuments();
  }
  QuerySnapshot querySnapshot;
  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: header(context,titleText: 'Ticket Details'),
           body: Center(
             child: Container(
               height: 550.0,
               width: 340.0,
               margin: EdgeInsets.all(10.0),
               color: Colors.yellow,
               child: _showDrivers(),

             ),
           )
    );

  }
  Widget _showDrivers(){
    if(querySnapshot != null){
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12.0),
        itemBuilder: (context, i){
          return Column(
            children: <Widget>[

              Divider(height: 10.0,),
              Text(
                'বাংলাদেশ রেলওয়ে আন্তঃনগর সার্ভিস',
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              Text(
                'BANGLADESH RAILWAY INTERCITY SERVICES',
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              Divider(height: 20.0,),
              Text('প্রাপক/Owner: ${querySnapshot.documents[i].data['username']}',style: TextStyle( color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),

              Text('Ticket ID: ',style: TextStyle(fontSize: 20.0,color: Colors.red),),

              Center(child: Text('(${querySnapshot.documents[i].data['ID']})',style: TextStyle(fontSize: 20.0, color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)),
              Divider(color: Colors.red,thickness: 2.0,),
              Row(
                children: <Widget>[
                  Text('ট্রেনের নাম/Name of Train: ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                  Text('${querySnapshot.documents[i].data['TrainName']}',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                ],
              ),
              Divider(thickness: 2.0,color: Colors.red,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('স্টেশান হতে/From: ',style: TextStyle(fontSize: 15.0,color: Colors.red)),
                        Text('${querySnapshot.documents[i].data['Form']}',style: TextStyle(fontSize: 20.0, color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward,color: Colors.red,),

                  Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('শেষ স্টেশান/To: ',style: TextStyle(fontSize: 15.0,color: Colors.red)),
                          Text('${querySnapshot.documents[i].data['To']}',style: TextStyle(fontSize: 20.0, color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                        ],
                      ),
                  ),
                ],
              ),
              Divider(thickness: 2.0,color: Colors.red,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                 // Expanded(
                  // child:
                    Column(
                      children: <Widget>[
                        Text('যাত্রার তাং/Journey Date: ',style: TextStyle(fontSize: 15.0,color: Colors.red),),

                        Text('(${querySnapshot.documents[i].data['Data']})',style: TextStyle(fontSize: 20.0, color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                      ],
                   // ),
                 ),
                  //Icon(Icons.label,color: Colors.red,),

                  // Expanded(
                   // child:
                    Row(
                      children: <Widget>[
                        Text('যাত্রার সময়/D।Time ',style: TextStyle(fontSize: 15.0,color: Colors.red)),

                        //Text('${querySnapshot.documents[i].data['Time']}',style: TextStyle(fontSize: 20.0, color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                        Text('9.00',style: TextStyle(fontSize: 20.0, color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                      ],
                    ),
                 // ),
                ],
              ),
             /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Jouney From: ',style: TextStyle(fontSize: 20.0)),
                  Text('${querySnapshot.documents[i].data['Form']}',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Journey To: ',style: TextStyle(fontSize: 20.0)),
                  Text('${querySnapshot.documents[i].data['To']}',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                ],
              ),*/
              Divider(thickness: 2.0,color: Colors.red,),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('শ্রেণী/Class: ',style: TextStyle(fontSize: 15.0)),
                         Text('${querySnapshot.documents[i].data['SitType']}',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward,color: Colors.red,),

                  Expanded(
                    child: Column(
                      children: <Widget>[
                         Text('আসন নং/Sit No: ',style: TextStyle(fontSize: 15.0)),
                        Text('${querySnapshot.documents[i].data['SitNumber']}',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 2.0,color: Colors.red,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('যাত্রী বিবরণী/Pass. Des: ',style: TextStyle(fontSize: 15.0)),
                        Text('${querySnapshot.documents[i].data['PassangerType']}',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward,color: Colors.red,),

                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('ভাড়া/Rent: ',style: TextStyle(fontSize: 15.0)),
                        //Text('${querySnapshot.documents[i].data['SitNumber']}',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                        Text('${querySnapshot.documents[i].data['Rent']} টা/T',style: TextStyle(fontSize: 20.0, color: Colors.red,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),

                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 2.0,color: Colors.red,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                ],
              ),

              Divider(),

             Row(
               children: <Widget>[
                 Expanded(
                   child: RaisedButton(
                     child: Text('Edit Ticket'),
                     color: Colors.red,
                     onPressed: (){
                       // Delete();
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateDataFromFireStore()));
                     },
                   ),
                 ),
                 VerticalDivider(),
                 Expanded(
                   child: RaisedButton(
                     child: Text('Cancel Ticket'),
                     color: Colors.red,
                     onPressed: (){
                       // Delete();
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteDataFromFireStore()));
                     },
                   ),
                 )

               ],
             ),





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
  }

}

