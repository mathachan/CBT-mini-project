import 'package:cbt/admin/admin_signin1.dart';
import 'package:cbt/admin/busdetailsadmin.dart';
import 'package:cbt/admin/dispbusdeets.dart';
import 'package:cbt/admin/dispstudents.dart';
import 'package:cbt/admin/expiry.dart';
import 'package:cbt/cards_design_home.dart';
import 'package:cbt/mainmap.dart';
import 'package:cbt/student/complaints/screens/dispcomp.dart';
import 'package:cbt/studentmap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'dart:ui';
class MakeDashboardItems1 extends StatefulWidget {
  static const String routeName = '/adminhome-screen';
  const MakeDashboardItems1({Key? key, required String title})
      : super(key: key);

  @override
  _MakeDashboardItemsState1 createState() => _MakeDashboardItemsState1();
}

class _MakeDashboardItemsState1 extends State<MakeDashboardItems1> {
  Card makeDashboardItem1(String title, String img, int index) {
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
        child: InkWell(
          onTap: () {
            //function move to diff pages
            if (index == 0) {
              //bus location
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MymapAppStud(text: '',)));
              //1.item
            }
            if (index == 1) {

             Navigator.push(
     context, MaterialPageRoute(builder: (context) => LoadDataFromComplaint()));
 //1.item
              //2.item
            }
            if (index == 2) {// update details
               Navigator.push(
     context, MaterialPageRoute(builder: (context) => Busd()));
              //3.item
            }
            if (index == 3) {
                         Navigator.push(
 context, MaterialPageRoute(builder: (context) => LoadDataFromBusdetails()));
              //4.item
            }
            if (index == 4) {
                         Navigator.push(// student details
 context, MaterialPageRoute(builder: (context) => LoadDataFromStudentdetails()));
              //5.item
            }
            if (index==5)
            {
                                      Navigator.push(
context, MaterialPageRoute(builder: (context) => expiry(text: '',)));
            }
            if (index == 6) {
              //6.item
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
                      "Admin:",
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
                makeDashboardItem1("Bus Location", "", 0),
                makeDashboardItem1("Complaints", "", 1),
                makeDashboardItem1("Update Routes", "", 2),
                makeDashboardItem1("View Bus Details", "", 3),
                makeDashboardItem1("View Student Details", "", 4),
                makeDashboardItem1("Update Bus Detail","",5),
                makeDashboardItem1("Sign Out", "", 6),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
