/*import 'package:cbt/common/widgets/custom_button.dart';
import 'package:cbt/common/widgets/custom_textfield.dart';
import 'package:cbt/constants/global_variables.dart';
import 'package:cbt/student/cards_design_student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Auth {
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _busnoController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _uidController.dispose();
    _nameController.dispose();
    _busnoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
              body: SingleChildScrollView (
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField1(
                          controller: _passwordController,
                          hintText: 'Password min 6 characters',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _uidController,
                          hintText: 'UID',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _busnoController,
                          hintText: 'BusNo',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                              print("Created New Account");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MakeDashboardItems2(
                                            title: '',
                                          )));
                            }).onError((error, stackTrace) {
                              print("error ${error.toString()}");
                            });
                            final student= Student_(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            uid: _uidController.text,
                            busno: _busnoController.text,
                          );
                          createstudent(student);
                          Navigator.pop(context, "Student Registered");
                          },
                        )
                      ],
                    ),
                  ),
                ),
          )
              
            ],
          ),
        ),
      ),
    );
  }
  Future createstudent(Student_ student) async {
    final docUser =
        FirebaseFirestore.instance.collection('studentdb').doc();
        // student.id = docUser.id;

    final json = student.toJson();
    await docUser.set(json);
  }
}

class Student_ {
  final String name;
  final String email;
  final String password;
  final String uid;
  final String busno;
  
  Student_({
    //  this.id = '',
    required this.name,
    required this.email,
    required this.password,
    required this.uid,
    required this.busno,
   
  });


//  
 Map<String, dynamic> toJson() => {
        
   'name': name,
    'email': email,
'password':password,
'uid':uid,
'busno':place,       
      };

//
}




// same
import 'package:cbt/common/widgets/custom_button.dart';
import 'package:cbt/common/widgets/custom_textfield.dart';
import 'package:cbt/constants/global_variables.dart';
import 'package:cbt/student/cards_design_student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _busnoController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _uidController.dispose();
    _nameController.dispose();
    _busnoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
             //    SingleChildScrollView (
                
                   Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField1(
                          controller: _passwordController,
                          hintText: 'Password min 6 characters',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _uidController,
                          hintText: 'UID',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _busnoController,
                          hintText: 'BusNo',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                              print("Created New Account");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MakeDashboardItems2(
                                            title: '',
                                          )));
                            }).onError((error, stackTrace) {
                              print("error ${error.toString()}");
                            });
                            final student= Student_(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            uid: _uidController.text,
                            busno: _busnoController.text,
                          );
                          createstudent(student);
                          Navigator.pop(context, "Student Registered");
                          },
                        )
                      ],
                    ),
          //      ),
               ),
                      
           
          ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'mail',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password (min 6 characters)',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                              print("Created New Account");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MakeDashboardItems2(
                                            title: '',
                                          )));
                            }).onError((error, stackTrace) {
                              print("error ${error.toString()}");
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          
          ),
        ),
      ),
    );
  }
  Future createstudent(Student_ student) async {
    final docUser =
        FirebaseFirestore.instance.collection('studentdb').doc();
       //  student.id = docUser.id;

    final json = student.toJson();
    await docUser.set(json);
  }
}

class Student_ {
 // final String id;
  final String name;
  final String email;
  final String password;
  final String uid;
  final String busno;
  
  Student_({
    //  this.id = '',
    required this.name,
    required this.email,
    required this.password,
    required this.uid,
    required this.busno,
   
  });


// 
 Map<String, dynamic> toJson() => {
        
   'name': name,
    'email': email,
'password':password,
'uid':uid,
'busno':busno,       
      };

//
*/
