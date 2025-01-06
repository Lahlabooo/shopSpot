

import 'package:flutter/material.dart';

abstract class AppStyle {

  static const textStyle12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );
  static const textStyle25 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
  static const textStyle18 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
  static  BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.grey[200], // Background color of the card
    borderRadius: BorderRadius.circular(20), // Rounded corners
    border: Border.all(
      color: Colors.white30,
      width: 1,
    ),
    boxShadow: const [
      BoxShadow(
        // color: Colors.grey.withOpacity(0.2), // Shadow color
        color: Colors.black12, // Shadow color
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(6, 6), // Shadow position
      ),
      BoxShadow(
        // color: Colors.grey.withOpacity(0.2), // Shadow color
        color: Colors.white, // Shadow color
        spreadRadius: 1,
        blurRadius: 10,
        offset: Offset(-1, -1), // Shadow position
      ),
    ],
  );
  static  BoxDecoration boxDecorationForNavBar = BoxDecoration(
    color: Colors.grey[200], // Background color of the card
    borderRadius: BorderRadius.circular(20), // Rounded corners
    border: Border.all(
      color: Colors.white30,
      width: 1,
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12, // Shadow color
        spreadRadius: 10,
        blurRadius: 20,

      ),
    ],
  );


}
