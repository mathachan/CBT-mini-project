//import 'dart:ui';
import 'package:cbt/admin/cards_design_admin.dart';
import 'package:cbt/common/widgets/custom_button.dart';
import 'package:cbt/common/widgets/custom_textfield.dart';
import 'package:cbt/constants/global_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Auth {
    signin,
}

class AuthScreen1 extends StatefulWidget{
    static const String routeName = '/auth-screen1';
    const AuthScreen1({Key? key}) : super(key : key);

    @override
    State<AuthScreen1> createState() => _AuthScreenState1();
}

class _AuthScreenState1 extends State<AuthScreen1> {
        Auth _auth=Auth.signin;
        final _signInFormKey =  GlobalKey<FormState>();
        final TextEditingController _emailController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        void dispose() {
            super.dispose();
            _emailController.dispose();
             _passwordController.dispose();   
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
                            const Text('Welcome',
                                     style:TextStyle(fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    ), 
                                     ),
                                    ListTile(
                                        tileColor: _auth == Auth.signin 
                            ? GlobalVariables.backgroundColor 
                            : GlobalVariables.greyBackgroundCOlor,
                           title: const Text(
                            'Admin Sign-In',
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
                                  _auth=val!;
                                });
                               },
                           ),

                                    ),
                                    if(_auth == Auth.signin)
                                Container(
                                   padding: const EdgeInsets.all(8),
                                   color: GlobalVariables.backgroundColor,
                                   child: Form(
                                        key: _signInFormKey,
                            child: Column(
                                children: [
                                       CustomTextField(controller: _emailController,
                                      hintText: 'Email',

                                ),
                                const SizedBox(height: 10),
                                     CustomTextField1(controller: _passwordController,
                                      hintText: 'Password',

                                ),
                                const SizedBox(height: 10),
                                CustomButton(
                                 text: 'Sign In',
                                onTap: () {
                                  FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _emailController.text, 
                              password: _passwordController.text)
                              .then((value)  {
                                print("Created New Account");
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>MakeDashboardItems1(title: '',)));
                            }).onError((error, stackTrace) {
                                print("error ${error.toString()}");
                                  Alert(context:context,
  title:"Failed Login",
  desc:"incorrect email or password")
  .show();
                            });
                                },//event move to admin home page
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
}