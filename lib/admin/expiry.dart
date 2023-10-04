import 'dart:convert';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class expiry extends StatefulWidget {
  final String text;
  static const String routeName = '/expiry-screen';
  const expiry({required this.text});

  @override
  _Stateexpiry createState() => _Stateexpiry();
}

class _Stateexpiry extends State<expiry> {
  final TextEditingController exp = TextEditingController();
  final TextEditingController rou = TextEditingController();
  //var db = FirebaseFirestore.firestore();

  // DateTime now = DateTime.now();
//  final String formatteddate =
  //    DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());
  //final String date = toString(dates);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bus Details Update'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),

          // alignment: Alignment.bottomCenter,
          children: <Widget>[
            TextField(
              controller: exp,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ENTER NEW DATE',
                hintText: 'TYPE YOUR NEW DATE',
              ),
            ),
            TextField(
              controller: rou,
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
                final update = update_(
                  date: exp.text,
                  route: rou.text,
                  // date: DateTime.parse(formatteddate),
                  //date: formatteddate,
                );
                updatexp(update);

                Navigator.pop(context, " Bus Details Updated");
              }, //ack page
            )
          ],
        ));
  }

  Future updatexp(update_ update) async {
    //reference to doc
    final docUser =
        FirebaseFirestore.instance.collection('bus_details').doc(rou.text).update({'expiry': exp.text});
    //  update.id = docUser.id;

   // final json = update.toJson();
   // await docUser.set(json);
  }
}

class update_ {
  String id;
  //final String complaint;
  final String route;
  final String date;
  update_({
    this.id = '',
    required this.date,
    required this.route,
  });

  Map<String, dynamic> toJson() => {
        'expiry': date,
      };

  // static Complaint_ fromJson(Map <String,dynamic.json>)=> Complaint_(
  //   id: json['id'],
  //   complaint: json['complaint'],
  //   route: json['route_']
  // );
}
