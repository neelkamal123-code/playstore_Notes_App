import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/screens/edit_note.dart';
import 'package:notes_app/screens/profile.dart';
import 'package:notes_app/screens/slideout.dart';
import 'package:notes_app/widgets/widgets.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes');
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return NavDrawer();
            }));
          },
          child: Icon(
            Icons.list,
          ),
        ),
        title: FitText("Notes", 20, Colors.white, FontWeight.bold, 1),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              getProfile(context);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: width/20,
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');

          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            // print("printing");
            // print(docs);
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                // print("data");
                // print(docs[i].id);
                // print(data);
                return ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EditNote(title: data['title'], description: data['description'],id: docs[i].id,dt: data['created'].toDate(),)));
                  },
                  title: Text(data['title']),
                  subtitle: Text(data['description']),
                  trailing: GestureDetector(
                    onTap: () {
                      docs[i].reference.delete();
                    },
                    child: Icon(
                      Icons.delete,
                    ),
                  ),
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
