import 'dart:convert';
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

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  void initState() {
    super.initState();
    isLooged();
  }

  void isLooged() {
    if (globals.isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(
                    title: 'MyHomePage',
                  )));
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    void _showAlertNoEmail(String value) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                title: Image.asset("assets/images/login.png"),
                content: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
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
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      'SignUp',
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

    void getUser(email, password) async {
      // ignore: non_constant_identifier_names
      CollectionReference CollectionUsers =
          FirebaseFirestore.instance.collection("Users");
      QuerySnapshot users = await CollectionUsers.get();
      // ignore: non_constant_identifier_names
      Map<String, dynamic> Users = {};
      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          // ignore: avoid_print
          Users.addAll({doc.id: doc.data()});
        }
        var bytes = utf8.encode(password);
        Users.map((key, value) {
          if (value['Correo'] == email &&
              value['Contraseña'] == sha512.convert(bytes).toString()) {
            globals.isLoggedIn = true;
            globals.documentId = key;
            globals.userName = value['Nombre'];
            return MapEntry(key, value);
          } else if (value['Correo'] == email) {
            globals.isLoggedEmailIn = true;
          }
          return const MapEntry(null, null);
        });
        if (globals.isLoggedIn == true) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: 'MyHomePage',
                      )));
        } else if (globals.isLoggedIn == false &&
            globals.isLoggedEmailIn == false) {
          _showAlertNoEmail("No existe niguna cuenta asosiada a este correo");
        } else if (globals.isLoggedIn == false &&
            globals.isLoggedEmailIn == true) {
          _showAlertNoEmail("contraseña incorrecta");
        }
      }
    }

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
            text: 'SignIn',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignUp()));
            },
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
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/login.png"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Correo",
                    hintText: "Correo",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _emailController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Contraseña",
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hintText: "Al menos 8 caracteres",
                    obsecureText: !_passwordVisible,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        }),
                    controller: _passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "¿Has olvidado tu contraseña?",
                            style: TextStyle(
                                color: AppColors.blue.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AuthButton(
                    onTap: () {
                      if (email.isNotEmpty && password.isNotEmpty) {
                        getUser(email, password);
                      } else {
                        _showAlertNoEmail(
                            "Llena los campos antes de continuar");
                      }
                    },
                    text: 'Iniciar Sesion',
                  ),
                  CustomRichText(
                    discription: "¿Aún no tienes una cuenta?",
                    text: "Registrarse",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
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
