//
//
//
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/widgets/m_text.dart';



void showSnackBar(BuildContext context , String message){
  Scaffold.of(context).showSnackBar(SnackBar(
    content: MText(
      text: message,
      color: Colors.white,
    ),
  ));
}
