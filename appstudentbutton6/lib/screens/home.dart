import 'package:appstudentbutton6/screens/profile.dart';
import 'package:appstudentbutton6/screens/signup.dart';
import 'package:appstudentbutton6/widgets/custom_header_home.dart';
import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/GlobalsVariables/globals.dart' as globals;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum MyDialogueAction { yes, no, maybe }

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    isLooged();
  }

  void isLooged() {
    if (!globals.isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignUp()));
    }
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
                globals.isLoggedIn = false;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MyProfile()));
              }),
          Padding(
            padding: const EdgeInsets.only(top: 85.0),
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
                    height: 250,
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
                        iconSize: 250,
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
