
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//keytool -list -v -keystore "C:\Users\neelp\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

void addData(title,description,context,id)async{

  //save to db

  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('notes');
  var data = {
    'title':title,
    'description':description,
    'created':DateTime.now(),
  };
  if (id!=null){
    ref
        .doc(id) // <-- Doc ID where data should be updated.
        .update(data) // <-- Updated data
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
  }
  else{
    ref.add(data);
  }

  Navigator.pop(context);

}