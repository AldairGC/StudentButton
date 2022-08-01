import 'package:appstudentbutton6/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/GlobalsVariables/globals.dart';

import '../widgets/custom_header.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    super.initState();
    _getContactsUser();
  }

  _getContactsUser() async {
    // ignore: non_constant_identifier_names
    CollectionReference CollectionUsers =
        FirebaseFirestore.instance.collection(documentId);
    QuerySnapshot user = await CollectionUsers.get();
    if (user.docs.isNotEmpty) {
      for (var doc in user.docs) {
        contacts.add(doc.data());
      }
    }
  }

  // ignore: non_constant_identifier_names
  Widget _buildItem(Contact) {
    return ListTile(
        title: Text(Contact),
        subtitle: const Text(''),
        leading: const Icon(Icons.contact_phone));
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
            text: 'Profile',
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                            title: 'MyHomePage',
                          )));
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
                  ListView(
                    children: contacts.map(_buildItem).toList(),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
