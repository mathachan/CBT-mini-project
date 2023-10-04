
import 'package:cbt/admin/admin_signin1.dart';
import 'package:cbt/driver/buslogin2.dart';
import 'package:cbt/pwd.dart';
import 'package:cbt/student/auth/screens/auth_screen_2.dart';
import 'package:cbt/student/complaints/screens/complaint.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

//import 'dart:ui' ;
class MakeDashboardItems extends StatefulWidget {
  const MakeDashboardItems({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MakeDashboardItems> createState() => _MakeDashboardItemsState();
}

class _MakeDashboardItemsState extends State<MakeDashboardItems> {
  
  
@override
void initState() {
  super.initState();
  configOneSignel();
}
void configOneSignel()
{
  OneSignal.shared.setAppId('7cc97fea-76dd-41a7-a1db-d41d8a2e618c');
}
  Card makeDashboardItem(String title, String img, int index) {
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
          onPressed: () {
            // main home for index 0 1 2 move to sign in pages resp
            if (index == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => AuthScreen2())); //driver
              //1.item

            }
            if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  AuthScreen())); //studenet
              //2.item
            }
            if (index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>AuthScreen1())); //admin
              //3.item
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              //  const SizedBox(height: 50),
              //  Center(
              // child: Image.asset(
              //  img,
              //  height: 50,
              //   width: 50,
              //  ),
              //   ),
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
      backgroundColor: const Color.fromARGB(255, 170, 193, 232),
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
                      "Home:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Profiles",
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
                // makeDashboardItem("Driver", "", 0),
                makeDashboardItem("Driver", "", 0),
                makeDashboardItem("Student", "", 1),
                makeDashboardItem("Admin", "", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
