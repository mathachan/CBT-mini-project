import 'package:cbt/common/util.dart';
import 'package:cbt/student/auth/screens/auth_screen_2.dart';
import 'package:cbt/student/cards_design_student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'custom_button.dart';
import 'package:cbt/common/widgets/custom_button.dart';
import 'package:cbt/common/widgets/custom_textfield.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'home.dart';
import 'package:flutter/material.dart';
/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      SplashScreen(
        seconds: 2,
        navigateAfterSeconds:MyHomePage(title: 'ALZ'),
        title: new Text(
          'WELCOME',textAlign: TextAlign.center,
          style: new TextStyle(
              letterSpacing: 3.0,
              fontWeight: FontWeight.w400,
              fontSize: 35.0,
              color: Color.fromARGB(255, 9, 9, 9)),
        ),
        
      ),
      
    );
    
  }
}*/
/*----------------------------------------------
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
             hexStringToColor("00172D"),
             hexStringToColor("0052A2"),
              hexStringToColor("92DFF3"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
              
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: _emailTextController,
                  hintText: 'Email',
                    ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField1(
                   controller: _passwordTextController,
                   hintText: 'Password min 6 characters',),
                const SizedBox(
                  height: 5,
                ),
                 firebaseUIButton(context, "Sign In", ()  {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute( builder: (context) => MakeDashboardItems2(
                                            title: '',)));
                  }).onError((error, stackTrace) {
                  
                    Alert(
                                context: context,
                                title: "Failed Login",
                                desc: "Incorrect Email Or Password.")
                            .show();
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
  

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AuthScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  
}
*/