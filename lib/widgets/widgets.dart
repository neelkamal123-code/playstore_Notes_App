import 'package:flutter/material.dart';



// To arrange every text according to width  of parent
Widget FitText(String text,double fontsize,Color colour,FontWeight fontweight,double letterspacing){
  return  FittedBox(
    fit:BoxFit.fitWidth,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: colour,
        fontWeight: fontweight,
        letterSpacing: letterspacing,

      ),
    ),
  );
}