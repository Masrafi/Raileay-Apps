import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttershare/widgets/header.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: RaisedButton(
              child: Text('BACK'),
              onPressed: (){
                Navigator.pop(context);
              },
              color: Colors.blue,
              textColor: Colors.yellowAccent,
              padding: EdgeInsets.all(2.0),
              splashColor: Colors.grey,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.backup),
                tooltip: 'Previous Page',
                onPressed: (){
                  //Navigator.pop(context);
                },
              )
            ],
            title: Text('Train Schedule',
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontFamily: 'Signatra'
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: Scrollbar(
            child: ListView(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    sortColumnIndex:1,
                    sortAscending: true,
                    columns: [
                      DataColumn(label: Text('Train No'), numeric: false),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Off-Day')),
                      DataColumn(label: Text('Departure Station')),
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Arrival Station')),
                      DataColumn(label: Text('Time')),
                    ],
                    rows: [
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('771')),
                            DataCell(Text('Rangpur Express')),
                            DataCell(Text('Sunday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('09:00')),
                            DataCell(Text('Rangpur')),
                            DataCell(Text('19:00')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('772')),
                            DataCell(Text('Rangpur Express')),
                            DataCell(Text('Sunday')),
                            DataCell(Text('Rangpur')),
                            DataCell(Text('20:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('06:15')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('751')),
                            DataCell(Text('Lalmoni Express')),
                            DataCell(Text('Friday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('22:10')),
                            DataCell(Text('Lalmonirhat')),
                            DataCell(Text('08:20')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('752')),
                            DataCell(Text('Lalmoni Express')),
                            DataCell(Text('Friday')),
                            DataCell(Text('Lalmonirhat')),
                            DataCell(Text('	10:40')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('21:05')),
                          ]
                      ),

                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('702')),
                            DataCell(Text('Subarna Express')),
                            DataCell(Text('Friday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('15:00')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('21:45')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('703')),
                            DataCell(Text('Mohanagar Goduli')),
                            DataCell(Text('')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('15:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('22:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('704')),
                            DataCell(Text('Mohanagar Provati')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('07:40')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('15:15')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('705')),
                            DataCell(Text('Ekota Express')),
                            DataCell(Text('Tuesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('10:00')),
                            DataCell(Text('Dinajpur')),
                            DataCell(Text('19:40')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('706')),
                            DataCell(Text('Ekota Express')),
                            DataCell(Text('Monday')),
                            DataCell(Text('Dinajpur')),
                            DataCell(Text('21:20')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('07:15')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('707')),
                            DataCell(Text('Tista Express')),
                            DataCell(Text('Monday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	07:20')),
                            DataCell(Text('Dewangong')),
                            DataCell(Text('12:55')),
                          ]
                      ),

                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('708')),
                            DataCell(Text('Tista Express')),
                            DataCell(Text('Monday')),
                            DataCell(Text('Dewangong')),
                            DataCell(Text('15:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('20:40')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('709')),
                            DataCell(Text('Parabat  Express')),
                            DataCell(Text('Tuesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('06:40')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('13:35')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('710')),
                            DataCell(Text('Parabat  Express')),
                            DataCell(Text('Tuesday')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('15:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('22:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('711')),
                            DataCell(Text('Upukol Express')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Noakhali')),
                            DataCell(Text('06:20')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('12:40')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('712')),
                            DataCell(Text('Upukol Express')),
                            DataCell(Text('Tuesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	16:20')),
                            DataCell(Text('Noakhali')),
                            DataCell(Text('22:35')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('717')),
                            DataCell(Text('Joyantika Express')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('12:00')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('19:50')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('718')),
                            DataCell(Text('Joyantika Express')),
                            DataCell(Text('Thursday')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('08:20')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('16:00')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('719')),
                            DataCell(Text('Paharia Express')),
                            DataCell(Text('Monday')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('08:15')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('17:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('720')),
                            DataCell(Text('Paharia Express')),
                            DataCell(Text('Saturday')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('10:15')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('20:00')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('721')),
                            DataCell(Text('Mohanagar Provati')),
                            DataCell(Text('Sunday')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('07:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('14:20')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('722')),
                            DataCell(Text('Mohanagar Goduli')),
                            DataCell(Text('Sunday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	15:20')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('22:50')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('723')),
                            DataCell(Text('Uddayan Express')),
                            DataCell(Text('Saturday')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('21:30')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('06:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('724')),
                            DataCell(Text('Uddayan Express')),
                            DataCell(Text('Sunday')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('21:20')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('06:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('729')),
                            DataCell(Text('Megna Express')),
                            DataCell(Text('')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('17:00')),
                            DataCell(Text('Chandpur')),
                            DataCell(Text('22:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('730')),
                            DataCell(Text('Megna Express')),
                            DataCell(Text('')),
                            DataCell(Text('Chandpur')),
                            DataCell(Text('	05:00')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('10:40')),
                          ]
                      ),

                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('735')),
                            DataCell(Text('Agnibina Express')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	09:40')),
                            DataCell(Text('Tarakandi')),
                            DataCell(Text('15:20')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('736')),
                            DataCell(Text('Agnibina Express')),
                            DataCell(Text('')),
                            DataCell(Text('Tarakandi')),
                            DataCell(Text('16:30')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('22:50')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('737')),
                            DataCell(Text('	Egarosindhur Provati')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	08:10')),
                            DataCell(Text('Kisoregonj')),
                            DataCell(Text('12:15')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('738')),
                            DataCell(Text('Egarosindhur Provati')),
                            DataCell(Text('')),
                            DataCell(Text('Kisoregonj')),
                            DataCell(Text('06:45')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	10:50')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('739')),
                            DataCell(Text('	Upaban Express')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('21:50')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('05:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('740')),
                            DataCell(Text('	Upaban Express')),
                            DataCell(Text('')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('22:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	05:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('741')),
                            DataCell(Text('Turna Express')),
                            DataCell(Text('')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('23:00')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('06:35')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('742')),
                            DataCell(Text('Turna Express')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('23:30')),
                            DataCell(Text('Chittagong')),
                            DataCell(Text('07:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('743')),
                            DataCell(Text('Bharamaputra')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('18.00')),
                            DataCell(Text('Dewangong')),
                            DataCell(Text('00:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('744')),
                            DataCell(Text('Bharamaputra')),
                            DataCell(Text('')),
                            DataCell(Text('Dewangong')),
                            DataCell(Text('06:30')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('12:15')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('745')),
                            DataCell(Text('Jamuna Express')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('		16:40')),
                            DataCell(Text('BB_East')),
                            DataCell(Text('00:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('746')),
                            DataCell(Text('Jamuna Express')),
                            DataCell(Text('')),
                            DataCell(Text('BB_East')),
                            DataCell(Text('	01:10')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('08:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('749')),
                            DataCell(Text('Egarosindhur Goduli')),
                            DataCell(Text('')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('18:30')),
                            DataCell(Text('Kisoregonj')),
                            DataCell(Text('23:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('750')),
                            DataCell(Text('Egarosindhur Goduli')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Kisoregonj')),
                            DataCell(Text('	12:45')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('16:55')),
                          ]
                      ),


                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('757')),
                            DataCell(Text('Drutojan Express')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	19:40')),
                            DataCell(Text('Dinajpur')),
                            DataCell(Text('05:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('758')),
                            DataCell(Text('Drutojan Express')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Dinajpur')),
                            DataCell(Text('07:40')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('17:55')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('767')),
                            DataCell(Text('Dolonchapa Express')),
                            DataCell(Text('')),
                            DataCell(Text('Santahar')),
                            DataCell(Text('	13:30')),
                            DataCell(Text('Dinajpur')),
                            DataCell(Text('20:30')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('768')),
                            DataCell(Text('Dolonchapa Express')),
                            DataCell(Text('')),
                            DataCell(Text('Dinajpur')),
                            DataCell(Text('05:40')),
                            DataCell(Text('Santahar')),
                            DataCell(Text('12:20')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('773')),
                            DataCell(Text('Kalani Express')),
                            DataCell(Text('Friday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('16:00')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('22:45')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('774')),
                            DataCell(Text('Kalani Express	')),
                            DataCell(Text('Friday')),
                            DataCell(Text('Sylhet')),
                            DataCell(Text('06:40')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('13:25')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('775')),
                            DataCell(Text('Sirajgong Express')),
                            DataCell(Text('Saturday')),
                            DataCell(Text('Ishurdi')),
                            DataCell(Text('07:45')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('15:100')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('777')),
                            DataCell(Text('Sirajgong Express')),
                            DataCell(Text('Saturday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('	17:00')),
                            DataCell(Text('Ishurdi')),
                            DataCell(Text('24:00')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('777')),
                            DataCell(Text('Mohangonj Express')),
                            DataCell(Text('Wednesday')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('23:50')),
                            DataCell(Text('Mohangonj')),
                            DataCell(Text('06:10')),
                          ]
                      ),
                      DataRow(
                          selected: true,
                          cells: [
                            DataCell(Text('778')),
                            DataCell(Text('Mohangonj Express')),
                            DataCell(Text('Thursday')),
                            DataCell(Text('Mohangonj')),
                            DataCell(Text('	08:30')),
                            DataCell(Text('Dhaka')),
                            DataCell(Text('14:40')),
                          ]
                      ),

                    ],
                  ) ,
                )
              ],
            ),
          )



      ),
    );
  }
}
