// ignore_for_file: use_build_context_synchronously

import 'package:appstudentbutton6/screens/profile.dart';
import 'package:appstudentbutton6/screens/signup.dart';
import 'package:appstudentbutton6/widgets/custom_header_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/GlobalsVariables/globals.dart' as globals;
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum MyDialogueAction { yes, no, maybe }

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    isLooged();
    _getInfoUser();
  }

  void isLooged() {
    if (!globals.isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignUp()));
    }
  }

  _getInfoUser() async {
    var data = await FirebaseFirestore.instance
        .collection("Users")
        .doc(globals.documentId)
        .get()
        .then((value) {
      return value.data();
    });
    if (data!.isNotEmpty) {
      globals.userEmail = data["Correo"].toString();
      globals.userMatricula = data["Matricula"].toString();
      globals.userName = data["Nombre"].toString();
    }
  }

  _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String messageAlert =
        "Hola, estoy en esta Ubicacion http://www.google.com/maps/place/${position.latitude},${position.longitude}, me siento en peligro!!";
    String messageLink = "https://wa.me/2227727939?text=$messageAlert";
    final Uri _url = Uri.parse(messageLink);

    launchUrl(_url, mode: LaunchMode.externalApplication);
  }

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
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await _getUserLocation();
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

  nameCustom(str) {
    final exp = RegExp('\\b[a-zA-Z]');
    var finalexp = exp.stringMatch(str);
    return finalexp?.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Container(
            color: AppColors.blue,
          ),
          CustomHeaderHome(
              text: nameCustom(globals.userName),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              }),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.22,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset("assets/images/login.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Ink(
                          child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.all_inclusive,
                          color: Colors.blueAccent,
                        ),
                        iconSize: MediaQuery.of(context).size.height * 0.3,
                        splashColor: Colors.redAccent,
                        onPressed: () {
                          var name = globals.userName;
                          _showAlert("$name estas en peligro?");
                        },
                      )),
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
