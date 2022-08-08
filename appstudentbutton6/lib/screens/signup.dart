import 'dart:convert';
import 'package:appstudentbutton6/screens/home.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/screens/signin.dart';
import 'package:appstudentbutton6/widgets/custom_button.dart';
import 'package:appstudentbutton6/widgets/custom_formfield.dart';
import 'package:appstudentbutton6/widgets/custom_header.dart';
import 'package:appstudentbutton6/widgets/custom_richtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appstudentbutton6/GlobalsVariables/globals.dart' as globals;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  void _showAlertNoEmail(String value) {
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signin()));
                  },
                  child: const Text(
                    'SignIp',
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

  void setUser(newEmail, newPass, newTuition, newUserName) async {
    // ignore: non_constant_identifier_names
    CollectionReference CollectionUsers =
        FirebaseFirestore.instance.collection("Users");
    Map<String, dynamic> contactos = {
      '1': "",
      '2': "",
    };
    var bytes = utf8.encode(newPass);
    final user = <String, dynamic>{
      "Correo": newEmail,
      "Contraseña": sha512.convert(bytes).toString(),
      "Matricula": newTuition,
      "Nombre": newUserName,
      "Contactos": contactos
    };
    await CollectionUsers.add(user);
  }

  _getUserEmail(String email) async {
    // ignore: non_constant_identifier_names
    CollectionReference CollectionUsers =
        FirebaseFirestore.instance.collection("Users");
    QuerySnapshot users = await CollectionUsers.get();
    var dataUsers = [];
    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        dataUsers.add(doc.data());
      }
    }
    if (dataUsers.any((element) => element['Correo'] == email)) {
      globals.isLoggedEmailIn = true;
    } else {
      globals.isLoggedEmailIn = false;
    }
  }

  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _tuitionController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();
  String get tuition => _tuitionController.text.trim();
  String get password => _passwordController.text.trim();
  bool _passwordVisible = false;

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
              text: 'SignUp',
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Signin()));
              }),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.15,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/login.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      headingText: "Usuario",
                      hintText: "Usuario",
                      obsecureText: false,
                      suffixIcon: const SizedBox(),
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      controller: _userName,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      headingText: "Correo",
                      hintText: "Correo",
                      obsecureText: false,
                      suffixIcon: const SizedBox(),
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      headingText: "Matricula",
                      hintText: "Matricula",
                      obsecureText: false,
                      suffixIcon: const SizedBox(),
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      controller: _tuitionController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      controller: _passwordController,
                      headingText: "Contraseña",
                      hintText: "Al menos 8 caracteres",
                      obsecureText: _passwordVisible,
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthButton(
                      onTap: () {
                        var func = true;
                        if (email.isNotEmpty &&
                            password.isNotEmpty &&
                            tuition.isNotEmpty &&
                            userName.isNotEmpty) {
                          _getUserEmail(email);
                          if (globals.isLoggedEmailIn == false) {
                            try {
                              setUser(email, password, tuition, userName);
                            } on Exception {
                              func = false;
                            }
                            if (func == true) {
                              globals.isLoggedIn = true;
                              globals.userName = userName;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage()));
                            }
                          } else {
                            _showAlertNoEmail("¡Corre ya Registrado!");
                            globals.isLoggedEmailIn = false;
                          }
                        } else {
                          _showAlertNoEmail(
                              "¡Llena los campos antes de continuar!");
                        }
                      },
                      text: 'Registrarte',
                    ),
                    CustomRichText(
                      discription: '¿Ya tienes una cuenta?',
                      text: 'Inicia Sesion',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signin()));
                      },
                    )
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
