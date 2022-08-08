import 'dart:convert';
import 'package:appstudentbutton6/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/screens/signup.dart';
import 'package:appstudentbutton6/widgets/custom_button.dart';
import 'package:appstudentbutton6/widgets/custom_formfield.dart';
import 'package:appstudentbutton6/widgets/custom_header.dart';
import 'package:appstudentbutton6/widgets/custom_richtext.dart';
import 'package:appstudentbutton6/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:appstudentbutton6/GlobalsVariables/globals.dart' as globals;

class Contacs extends StatefulWidget {
  const Contacs({Key? key}) : super(key: key);

  @override
  State<Contacs> createState() => _ContacsState();
}

class _ContacsState extends State<Contacs> {
  @override
  void initState() {
    super.initState();
  }

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  String get name => _nameController.text.trim();
  String get number => _numberController.text.trim();

  Map<String, dynamic> contactos = {
    '1': "",
    '2': "",
    '3': "",
  };

  _updateDataContacts(contactos) async {
    var collection = FirebaseFirestore.instance.collection('Users');
    collection
        .doc(globals.documentId)
        .update({"Contactos": contactos})
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));
  }

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
            text: 'Contacs',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.15,
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
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/login.png"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Nombre",
                    hintText: "Nombre",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _nameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Numero",
                    hintText: "Numero",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _nameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthButton(
                    onTap: () {},
                    text: 'Agregar',
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
