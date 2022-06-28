// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:studentbutton/styles/app_colors.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:location/location.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:geocoder/geocoder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum MyDialogueAction { yes, no, maybe }

class _MyHomePageState extends State<MyHomePage> {
  _database() async {
    // LocationData currentLocation;

    // var location = Location();
    try {
      // currentLocation = await location.getLocation();

      // double lat = currentLocation.latitude;
      // double lng = currentLocation.longitude;
      /*final response = await http.post(
          "http://192.168.1.107/sahyog/views/sahyogflutter/helper/demo/geocode.php",
          body: {
            "lat": lat.toString(),
            "lng": lng.toString(),
            "action": "geo_loc",
          });
      Map<String, dynamic> _data = jsonDecode(response.body);*/
      // final coordinates = Coordinates(lat, lng);
      // var addresses =
      // await Geocoder.local.findAddressesFromCoordinates(coordinates);
      // var first = addresses.first;
      // ignore: avoid_print
      // print("${first.featureName} : ${first.addressLine}");
      // _neverSatisfied(first);
    } catch (e) {
      // ignore: avoid_print
      print("error");
      // ignore: avoid_print
      print(e);
    }
  }

  /*Future<void> _neverSatisfied(var first) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Location'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("${first.addressLine}")],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/
  void _showAlert(String value) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: Image.asset("assets/images/login.png"),
              content: Text(
                value,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'SI',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'NO',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
              elevation: 10,
              // backgroundColor: const Color.fromARGB(255, 230, 116, 40),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            child: const Text(
              "aldair",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("assets/images/login.png"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.blue,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.all_inclusive,
                              color: Colors.blueAccent,
                            ),
                            iconSize: 150,
                            splashColor: Colors.redAccent,
                            padding: const EdgeInsets.all(80.0),
                            onPressed: () {
                              _showAlert("Nombre de usuario estas en peligro?");
                              _database();
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signin()));*/
                            },
                          )),
                      const Padding(
                        padding: EdgeInsets.all(25.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
