import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    Key? key, 
    required this.controller,
    required this.hintText,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: hintText,
    border: const OutlineInputBorder(
               borderSide: BorderSide(
               color: Colors.blueGrey,
        )
      ),
      enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
      color: Colors.blueGrey,
)
      )
     );
    return TextFormField(
     controller: controller,
     decoration: inputDecoration , 
    validator:(val) 
    {

    },
    );
  }
}

class CustomTextField1 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField1({
    Key? key, 
    required this.controller,
    required this.hintText,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: hintText,
  
  
    border: const OutlineInputBorder(
               borderSide: BorderSide(
               color: Colors.blueGrey,
        )
      ),
      enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
      color: Colors.blueGrey,
)
      )
     );
    return TextFormField(
             obscureText: true,
obscuringCharacter: "*",
     controller: controller,
     decoration: inputDecoration , 
    validator:(val) 
    {

    },
    );
  }
}
