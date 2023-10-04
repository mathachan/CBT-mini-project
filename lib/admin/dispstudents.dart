import 'package:cbt/constants/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoadDataFromStudentdetails extends StatefulWidget {
  @override
  _LoadDataFromStudentdetailsState createState() => _LoadDataFromStudentdetailsState();
}

class _LoadDataFromStudentdetailsState extends State<LoadDataFromStudentdetails> {
  @override
  void initState() {
    super.initState();
  }

  //late QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
      Expanded(
          child: StreamBuilder(
        //  _showComplaints(),
        stream: FirebaseFirestore.instance.collection('studentdb').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text("Name: ${snapshot.data!.docs[index]['name'].toString()}"),
                  subtitle: Wrap(
                    children: [
                      Text("Email: ${snapshot.data!.docs[index]['email'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                       Text("UID: ${snapshot.data!.docs[index]['uid'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                       Text("BusNo: ${snapshot.data!.docs[index]['busno'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                  //    Text(snapshot.data!.docs[index]['id'].toString()),
                    ],
                  //  ),
                  ),
                );
              });
        },
      )),
      ],
      ),
      ),
      ),
    );
  }
}