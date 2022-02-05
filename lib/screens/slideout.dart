import 'package:flutter/material.dart';
import 'package:notes_app/controller/firebase_service.dart';
import 'package:notes_app/screens/profile.dart';
import 'package:notes_app/widgets/widgets.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: FitText("", 0, Colors.white, FontWeight.normal, 0),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/sidebarbackground.jfif'))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {getProfile(context)},
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              FirebaseService service = new FirebaseService();
              service.signOutFromGoogle(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Back'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

