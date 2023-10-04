import 'dart:convert';
//import 'dart:html';

import 'package:cbt/drivermap.dart';
import 'package:cbt/mainmap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class route extends StatefulWidget {
  static const String routeName = '/route-screen';
  const route({Key? key, required String title}) : super(key: key);

  @override
  _Stater createState() => _Stater();
}

class _Stater extends State<route> {
  final route = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bus Route'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),

          // alignment: Alignment.bottomCenter,
          children: <Widget>[
            TextField(
              controller: route,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ENTER YOUR BUS NO',
                hintText: 'TYPE YOUR BUS NO HERE..',
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
                //also this has to be added to db
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MymapAppdriver(
                              text: route.text,
                            )));
              }, //ack page
            )
          ],
        ));
  }
}
