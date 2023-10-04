import 'dart:convert';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class complaint extends StatefulWidget {
  static const String routeName = '/complaint-screen';
  const complaint({Key? key, required String title}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<complaint> {
  final TextEditingController comp = TextEditingController();
  final TextEditingController rou = TextEditingController();

  DateTime now = DateTime.now();
  final String formatteddate= DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());
  //final String date = toString(dates);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bus Tracker Complaints'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),

          // alignment: Alignment.bottomCenter,
          children: <Widget>[
            TextField(
              controller: comp,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ENTER YOUR QUERIES/COMPLAINTS',
                hintText: 'TYPE YOUR QUERIES/COMPLAINTS HERE..',
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
                final complaint = Complaint_(
                    complaint: comp.text, 
                    route: rou.text,
                  // date: DateTime.parse(formatteddate),
                  date: formatteddate,
                );
                createcomplaint(complaint);
                 final snackBar = SnackBar(
 content:  Text(" Complaint Registered"),
   );
                Navigator.pop(context, "complaint registered");
              }, //ack page
            )
          ],
        ));
  }

  Future createcomplaint(Complaint_ complaint) async {
    //reference to doc
    final docUser = FirebaseFirestore.instance.collection('Complaints').doc();
    complaint.id = docUser.id;

    final json = complaint.toJson();
    await docUser.set(json);
  }
}

class Complaint_ {
  String id;
  final String complaint;
  final String route;
  final String date;
  Complaint_({
    this.id = '',
    required this.complaint,
    required this.route,
   required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'complaint': complaint,
        'route_': route,
       'date': date,
      };

  // static Complaint_ fromJson(Map <String,dynamic.json>)=> Complaint_(
  //   id: json['id'],
  //   complaint: json['complaint'],
  //   route: json['route_']
  // );
}

/*class complaintdisp extends StatefulWidget {
  static const String routeName = '/complaintdisplay-screen';
  const complaintdisp({Key? key}) : super(key: key);

  @override
  _State1 createState() => _State1();
}

class _State1 extends State<complaintdisp> {
  final controller=TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Display Complaints'),

    ),
    body: StreamBuilder(
      stream: dispcomp(),
      builder: (context,snapshot)
      {
        if(snapshot.hasError){
          return Text('something went wrong ${snapshot.error}')
        }
       else if (snapshot.hasData){
          final Complaints= snapshot.data!;

          return ListView(
            children: Complaints.map(Buildisp).toList(),
          );
        }
        else {
          return Center(child: CircularProgressIndicator());
        }
 }),
 //floatingActionButton: FloatingActionButton(
  //child: ,
// ),
      );
        
       


Widget Buildisp(Complaint_ complaint)=> ListTile(
//  leading: CircleAvatar(child: Te),
title: Text(complaint.complaint),
subtitle: Text(complaint.route),
);

  Stream<List<Complaint_>> dispcomp() => FirebaseFirestore.instance
.collection('Complaints')
.snapshots()
.map((snapshot) => snapshot.docs.map((doc)=> Complaint_.fromJson(doc.data())).toList());

}*/
