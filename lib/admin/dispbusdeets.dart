import 'package:cbt/constants/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoadDataFromBusdetails extends StatefulWidget {
  @override
  _LoadDataFromBusdetailsState createState() => _LoadDataFromBusdetailsState();
}

class _LoadDataFromBusdetailsState extends State<LoadDataFromBusdetails> {
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
        title: Text('Bus Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
      Expanded(
          child: StreamBuilder(
        //  _showComplaints(),
        stream: FirebaseFirestore.instance.collection('bus_details').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text("Bus No: ${snapshot.data!.docs[index]['busno'].toString()}"),
                  subtitle: Wrap(
                    children: [
                      Text("Bus route: ${snapshot.data!.docs[index]['busroute'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                       Text("Driver Name: ${snapshot.data!.docs[index]['driver name'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                       Text("Contact No: ${snapshot.data!.docs[index]['driverno'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                       Text("Place: ${snapshot.data!.docs[index]['place'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                    
                    
                       Text("Start Time: ${snapshot.data!.docs[index]['startime'].toString()}"),
                      SizedBox(
                        width: 20,
                      ),
                       Text("Fitness Expiry Date: ${snapshot.data!.docs[index]['expiry'].toString()}"),
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
