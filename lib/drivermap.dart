import 'dart:async';
import 'dart:convert';

import 'package:cbt/mymap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class MymapAppdriver extends StatefulWidget {
  final String text;
  const MymapAppdriver({required this.text});
  @override
  _MymapAppStatedriver createState() => _MymapAppStatedriver();
}

class _MymapAppStatedriver extends  State<MymapAppdriver> { // extends MymapApp {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
 // String x = 'hello'; registered






  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('live location tracker'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                _getLocation(); // this func can be added to button
              },
              child: Text('add my location')),
          TextButton(
              onPressed: () {
                _listenLocation();
              },
              child: Text('enable live location')),
          TextButton(
              onPressed: () {
               // sendNotification([tokenId], "Bus has departed", "Alert");
                _stopListening();
              },
              child: Text('stop live location')),
        ],
      ),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc(widget.text).set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': widget.text, //
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc(widget.text).set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': widget.text // check how to adddmultiple useers locations
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}

