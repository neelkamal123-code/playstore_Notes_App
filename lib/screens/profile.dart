import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/controller/firebase_service.dart';
import 'package:notes_app/widgets/widgets.dart';

Future<void> getProfile(BuildContext context){
  User? user = FirebaseAuth.instance.currentUser;
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return Container(

          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Padding(
              padding: EdgeInsets.all(width/20),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL!),
                    radius: width/10,
                  ),


                  FitText("${user.displayName}", 30, Colors.white, FontWeight.bold, 1),
                  FitText("${user.email}", 20, Colors.white, FontWeight.normal, 2),


                  ElevatedButton(
                    child: FitText("Logout", 30, Colors.white,FontWeight.normal,1),
                    onPressed: () {
                      FirebaseService service = new FirebaseService();
                      service.signOutFromGoogle(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      });
}