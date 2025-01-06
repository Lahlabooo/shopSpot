import 'package:flutter/material.dart';

bool isLight(context){
   return Theme.of(context).brightness == Brightness.dark ? false:true;
}