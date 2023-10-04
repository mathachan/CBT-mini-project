import 'dart:convert';
//import 'dart:html';

import 'package:cbt/admin/admin_signin1.dart';
import 'package:cbt/driver/buslogin2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class password extends StatefulWidget {
  static const String routeName = '/complaint-screen';
  const password({Key? key, required String title}) : super(key: key);

  @override
  _Statepassword createState() => _Statepassword();
}

class _Statepassword extends State<password> {
  final TextEditingController pw = TextEditingController();
  

  final String pw1="admin";
  final String pw2="driver"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bus tracker authentication'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),

          // alignment: Alignment.bottomCenter,
          children: <Widget>[
            TextField(
              obscureText: true,
              controller: pw,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ENTER YOUR password',
                hintText: 'TYPE YOUR password..',
              ),
            ),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue, //bg
                  onPrimary: Colors.white // foreground
                  ),

              child: Text('SUBMIT'),
              onPressed: () //pop and display
                  {
                 if(pw==pw1) //Admin
                 {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AuthScreen1()));
                 }
                 if(pw==pw2) //Driver
                 {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AuthScreen2()));
                 }
                 else
                
                Navigator.pop(context, "Wrong User!");
              }, //ack page
            )
          ],
        ));
  }

 
}