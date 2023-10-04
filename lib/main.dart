import 'package:cbt/cards_design_home.dart';
import 'package:cbt/driver/buslogin2.dart';
import 'package:cbt/driver/homedriver1.dart';

import 'package:cbt/student/auth/screens/auth_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
//import 'dart:html';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //onGenerateRoute: (settings) => generateRoute(settings),

      home: const MakeDashboardItems(//main home page
        title: '',
      ),
    );
  }
}