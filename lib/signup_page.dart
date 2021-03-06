import 'dart:async';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignUpPatient extends StatefulWidget {
  const SignUpPatient({Key? key}) : super(key: key);

  @override
  _SignUpPatientState createState() => _SignUpPatientState();
}

class _SignUpPatientState extends State<SignUpPatient> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Mywidgets.getAppBar("SignUpPatient"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextField(
            hint: 'Username',
            prefix: FaIcon(FontAwesomeIcons.user),
            con: username,
            obscure: false,
          ),
          CustomTextField(
            hint: 'Password',
            prefix: FaIcon(FontAwesomeIcons.lock),
            con: password,
            obscure: true,
          ),
          CustomTextField(
            hint: 'Full Name',
            con: Name,
            prefix: FaIcon(FontAwesomeIcons.person),
            obscure: false,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomGoogleMaps(
                  getlatlong: (lat, long) {
                    print("latit tude is  $lat , $long");
                  },
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 210,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    FaIcon(FontAwesomeIcons.map),
                    Text('Add Address'),
                  ],
                ),
              ),
            ),
          ),


          ElevatedButton(
              onPressed: () {
                print("${username.text} ${Name.text} ${password.text}");
              },
              child: Text('Sign Up')),
        ],
      ),
    );
  }
}
