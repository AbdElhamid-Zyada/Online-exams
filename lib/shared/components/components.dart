import 'package:flutter/material.dart';

Widget RegisterationTextFormField(
        {String? hint, IconData? icon, TextEditingController? controller}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color.fromARGB(250, 3, 48, 67),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color.fromARGB(250, 3, 48, 67),
        ),
      ),
    );


// one for text 

// one for text button