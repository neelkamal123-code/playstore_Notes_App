import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/screens/login.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String?> signInwithGoogle() async {
    try {
      print("its here");
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      print(2);
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      var userData = {
          'name':googleSignInAccount.displayName,
          'email':googleSignInAccount.email,
      };

      users.doc(user!.uid).get().then((value){
        if(value.exists){
          //old user (update data)
          value.reference.update(userData);
        }
        else{
          users.doc(user.uid).set(userData);
        }

      });


    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle(BuildContext context) async{
    await _googleSignIn.signOut();
    await _auth.signOut();
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
  }
}

