import 'package:cbt/constants/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoadDataFromComplaint extends StatefulWidget {
  @override
  _LoadDataFromComplaintState createState() => _LoadDataFromComplaintState();
}

class _LoadDataFromComplaintState extends State<LoadDataFromComplaint> {
  @override
  void initState() {
    super.initState();
    // getDriversList().then((results) {
    //     setState(() {
    //     querySnapshot = results;
    //  });
    // });
  }

  //late QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: AppBar(
        title: Text('Complaints'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
      Expanded(
          child: StreamBuilder(
        //  _showComplaints(),
        stream: FirebaseFirestore.instance.collection('Complaints').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(snapshot.data!.docs[index]['complaint'].toString()),
                  subtitle: Wrap(
                    children: [
                      Text("Bus No: ${snapshot.data!.docs[index]['route_'].toString()}"),
                      SizedBox(
                        width: 70,
                      ),
                          Text("date: ${snapshot.data!.docs[index]['date'].toString()}"),                 
                    
                    
                    

                       Text("Complaint id: ${snapshot.data!.docs[index]['id'].toString()}"),
                         SizedBox(
                        width: 500,
                      ),
                    ],
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