import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cbt/common/widgets/custom_button.dart';
import 'package:cbt/common/widgets/custom_textfield.dart';
import 'package:cbt/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Busd extends StatefulWidget {
  static const String routeName = '/bus-screen';
  const Busd({Key? key}) : super(key: key);

  @override
  State<Busd> createState() => _BusdState();
}

class _BusdState extends State<Busd> {
  final _submitFormKey = GlobalKey<FormState>();
  final TextEditingController _busnoController = TextEditingController();
  final TextEditingController _drivernoController = TextEditingController();
  final TextEditingController _busrouteController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _startimeController = TextEditingController();
  final TextEditingController _drivernameController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  

  @override
  void dispose() {
    super.dispose();
    _busnoController.dispose();
    _drivernoController.dispose();
    _drivernameController.dispose();
    _busrouteController.dispose();
    _placeController.dispose();
    _startimeController.dispose();
    _expiryController.dispose();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, //crossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // ignore: prefer_const_constructors
              ListTile(
                tileColor: GlobalVariables.backgroundColor,
                title: const Text(
                  'Bus Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _submitFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _busnoController,
                          hintText: 'Bus No',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _drivernameController,
                            hintText: 'Driver Name.'),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _drivernoController,
                            hintText: 'Driver Contact No.'),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _busrouteController,
                          hintText: 'Bus Route',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _placeController,
                          hintText: 'Place',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _startimeController,
                          hintText: 'Start time',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _expiryController,
                          hintText: 'Expiry Date',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                            text: 'Submit',
                            onTap: () {
                              final bus_detail = Busdetails_(
                                  busno: _busnoController.text,
                                  driverno: _drivernoController.text,
                                  drivername: _drivernameController.text,
                                  busroute: _busrouteController.text,
                                  place: _placeController.text,
                                  startime: _startimeController.text,
                                  expiry: _expiryController.text);
                              createbusdetail(bus_detail);
                              Navigator.pop(context, "Route registered");
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createbusdetail(Busdetails_ bus_detail) async {
    final docUser = FirebaseFirestore.instance.collection('bus_details').doc(_busnoController.text);
    //bus_detail.id = docUser.id;

    final json = bus_detail.toJson();
    await docUser.set(json);
  }
}

class Busdetails_ {
  final String busno;
  final String driverno;
  final String drivername;
  final String busroute;
  final String place;
  final String startime;
  final String expiry;

  Busdetails_({
    //  this.id = '',
    required this.busno,
    required this.driverno,
    required this.drivername,
    required this.busroute,
    required this.place,
    required this.startime,
    required this.expiry,
  });

// /*
// comment from here
  Map<String, dynamic> toJson() => {
        'busno': busno,
        'driverno': driverno,
        'driver name': drivername,
        'busroute': busroute,
        'place': place,
        'startime': startime,
        'expiry': expiry,
      };

//
//*/
//
//
}
