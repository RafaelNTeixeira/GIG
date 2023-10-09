import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gig/displays/profile-page.dart';
import '../../displays/about-page.dart';
import '../../displays/login-page.dart';
import '../../displays/main-page.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'GIG MENU',
              style: TextStyle(
                color: Colors.teal.shade400,
                fontSize: 25,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input, color: Colors.teal.shade400),
            title: Text(
              'GIG Page',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()),)},
          ),
          ListTile(
            leading: Icon(Icons.account_circle_sharp, color: Colors.teal.shade400),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),)},
          ),
          ListTile(
            leading: Icon(Icons.border_color, color: Colors.teal.shade400),
            title: Text(
              'About Us',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()),)},
          ),
          ListTile(
            key: Key("LogoutButton"),
            leading: Icon(Icons.exit_to_app, color: Colors.teal.shade400),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
