import 'package:flutter/material.dart';
import 'package:studentbutton/widgets/custom_header.dart';
import 'package:studentbutton/screens/signup.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:geocoder/geocoder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          CustomHeader(
            text: 'Inicia Sesion',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignUp()));
            },
          ),
        ],
      ),
    ));
  }
}
