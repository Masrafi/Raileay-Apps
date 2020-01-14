import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:geolocator/geolocator.dart';




class Location extends StatefulWidget {
  User currentUser;
  Location({this.currentUser});
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  handleSubmit() async{
    locationController.clear();
    setState(() {
    });
  }
  var locationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,titleText: 'Location'),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Divider(),
            Padding(
              padding: EdgeInsets.all(5.0),
              child:Container(
                height: 200.0,
                margin: const EdgeInsets.only(right: 5, left: 5),
                child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your Current Location',
                      //border: InputBorder.none,
                    ),
                    style: new TextStyle(
                        fontSize: 14.0,
                        height: 15.0,
                        color: Colors.black
                    )
                ),
              ),
            ),

            Divider(),
            Container(
              height: 100.0,
              width: 200.0,
              alignment: Alignment.center,
              child: RaisedButton.icon(
                label: Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.blueAccent,
                onPressed: getCurrentUserLocation,
                icon: Icon(Icons.location_on,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  getCurrentUserLocation()async{
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    List<Placemark> marks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = marks[0];
    String complteAddress = '${placemark.name},${placemark.subAdministrativeArea},${placemark.country}';
    locationController.text = complteAddress;
  }
}
