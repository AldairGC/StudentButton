import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentbutton/controllers/auth_controller.dart';
import 'package:studentbutton/screens/signup.dart';
// import 'package:studentbutton/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentButton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUp(),
    );
  }
}
