import 'package:cbt/cards_design_home.dart';
import 'package:cbt/driver/buslogin2.dart';
import 'package:cbt/driver/route.dart';
import 'package:cbt/mainmap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'dart:ui';

class MakeDashboardItems1 extends StatefulWidget {// driver
  static const String routeName = '/dashboard-screen1';

  const MakeDashboardItems1({Key? key, required String title}) : super(key: key);

  @override
  _MakeDashboardItemsState1 createState() => _MakeDashboardItemsState1();
}

class _MakeDashboardItemsState1 extends State<MakeDashboardItems1> {
  Card MakeDashboardItem1(String title, String img, int index) {
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
          onPressed: () {//only index 1 and update geo loc
            if (index == 0) {
                 Navigator.push(
     context,
      MaterialPageRoute(
       // ignore: prefer_const_constructors
       builder: (context) => route(title: '',)));//map

              //1.item
            }
            if (index == 1) {
              //2.item
                 print("Signed Out");
    FirebaseAuth.instance.signOut().then((value) {
        Navigator.push(context,
      MaterialPageRoute(builder: (context) => MakeDashboardItems(title: '',)));
 });
            }
            if (index == 2) {
              //3.item
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
      appBar: AppBar(title: Text('Driver')),
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
                      "Driver",
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
                MakeDashboardItem1("Update Location", "", 0),
                MakeDashboardItem1("Sign Out","",1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
