import 'package:flutter/material.dart';
import 'package:fluttershare/pages/schedule.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:flutter/cupertino.dart';

class Contact extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context,titleText: 'Contact'),
        body: Scrollbar(
          child: ListView(
            children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text('For refund of unsuccessful purchases and card charging issues: ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                Divider(color: Colors.black,endIndent: 0.0,thickness: 2.0,),
                Row(
                      children: <Widget>[
                        Text(
                            'VISA/MASTER Cards :'
                        ),
                        Text(
                            ' 16234     +88-02-8331040'
                        )
                      ],
                    ),
                Divider(color: Colors.black,endIndent: 0.0,thickness: 2.0,),
                    Row(
                      children: <Widget>[
                        Text(
                            'Rocket / DBBL Nexus Cards	 :'
                        ),
                        Text(
                            ' 16216'
                        )
                      ],
                    ),

                Divider(color: Colors.black,endIndent: 0.0,thickness: 2.0,),

                    Row(
                      children: <Widget>[
                        Text(
                            'bKash :'
                        ),
                        Text(
                            ' 16247'
                        )
                      ],
                    ),
                Divider(color: Colors.black,endIndent: 0.0,thickness: 2.0,),
                Divider(height: 25.0,),
                Text('For refund of successfully purchased tickets',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                Divider(),
                Text('Visit your originating station ( Name of the Station From which you wanted to travel ) and contact the refund counter'),
                Divider(),
                Text('For Technical Support	',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                Divider(color: Colors.black,endIndent: 0.0,thickness: 2.0,),
                Row(
                  children: <Widget>[
                    Text(
                        'Tech Support Team	 :'
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                            '      esheba-ticket@cnsbd.com'
                        ),
                        Text(
                            '+880-1401168806'
                        )
                      ],
                    )

                  ],
                ),
                Divider(color: Colors.black,endIndent: 0.0,thickness: 2.0,),
                Divider(height: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Schedule()));
                    //_launchURL();
                  },
                  child: Container(
                    width: 400.0,
                    height: 50.0,
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    child: const
                    Text('For Train Schedule Click Here',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.red,fontFamily: 'Signatra')),
                  ),
                )
              ],
            ),
          )
            ],
          ),
        ),

    );
  }
}
