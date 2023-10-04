import 'dart:io';

import 'package:cbt/admin/admin_signin1.dart';
import 'package:cbt/cards_design_home.dart';
import 'package:cbt/common/widgets/custom_button.dart';
import 'package:cbt/mainmap.dart';
import 'package:cbt/student/auth/screens/auth_screen_2.dart';
import 'package:cbt/student/complaints/screens/complaint.dart';
import 'package:cbt/student/emergency.dart';
import 'package:cbt/studentmap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class MakeDashboardItems2 extends StatefulWidget {//student
  const MakeDashboardItems2({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MakeDashboardItems2> createState() => _MakeDashboardItemsState2();
}

class _MakeDashboardItemsState2 extends State<MakeDashboardItems2> {
  Card makeDashboardItem2(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Color(0xFF004B8D),
                    Color(0xFFffffff),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Colors.cyan,
                    Colors.amber,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              ),
        child: FlatButton(
          color: Color.fromRGBO(161, 108, 164, 1.0),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          textColor: Colors.white,
          onPressed: () async {
            if (index == 0) {
              //bus location
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MymapAppStud(text: '',)));
              //1.item
            }
            if (index == 1) {
              // complaint
              var message = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const complaint(title: ''); //complaint();
              }));
              print(message);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => complaint()));
              //2.item
            }
            if(index==2){
                  Navigator.push(
               context, MaterialPageRoute(builder: (context) => App()));
            }
            if (index==3){
              print("Signed Out");
               FirebaseAuth.instance.signOut().then((value) {
                   Navigator.push(context,
                 MaterialPageRoute(builder: (context) => MakeDashboardItems(title: '',)));
            });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              // const SizedBox(height: 50),
              //Center(
              //child: Image.asset(
              //img,
              //height: 50,
              //width: 50,
              //   ),
              // ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 193, 232),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Student:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem2("Bus location", "", 0),
                makeDashboardItem2("Complaints", "", 1),
                 makeDashboardItem2("EMERGENCY", "", 2),
                makeDashboardItem2("Sign Out", "", 3),
               
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
