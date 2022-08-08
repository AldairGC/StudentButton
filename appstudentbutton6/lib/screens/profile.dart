import 'dart:convert';

import 'package:appstudentbutton6/screens/contacs.dart';
import 'package:appstudentbutton6/screens/home.dart';
import 'package:appstudentbutton6/widgets/custom_button_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/widgets/custom_header.dart';
import 'package:appstudentbutton6/GlobalsVariables/globals.dart' as globals;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  _updateData(password, email, tuition, name) async {
    var collection = FirebaseFirestore.instance.collection('Users');
    var bytes = utf8.encode(password);
    collection
        .doc(globals.documentId)
        .update({
          'Correo': email,
          'Matricula': tuition,
          'Nombre': name,
          'Contraseña': name,
        })
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));
  }

  final _userName = TextEditingController(text: globals.userName);
  final _emailController = TextEditingController(text: globals.userEmail);
  final _tuitionController = TextEditingController(text: globals.userMatricula);
  final _passwordController = TextEditingController(text: "12345");

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();
  String get tuition => _tuitionController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          CustomHeader(
              text: 'Profile',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              }),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.whiteshade,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/login.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: _userName,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.assignment_ind_outlined),
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),
                          helperText: 'Nombre',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: _tuitionController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.account_box),
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),
                          helperText: 'Matricula',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.attach_email_outlined),
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),
                          helperText: 'Correo',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),
                          helperText: 'Contraseña',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthButtonProfile(
                      onTap: () {
                        _updateData(password, email, tuition, userName);
                      },
                      text: 'Actualizar',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthButtonProfile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Contacs()));
                      },
                      text: 'Contactos de Emergencia(proximamente)',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
