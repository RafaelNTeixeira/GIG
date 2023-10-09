import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gig/displays/service-provider-main-page.dart';
import 'package:gig/displays/service-requester-main-page.dart';
import '../database/database-management.dart';
import '../model/user.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final searchController = TextEditingController();
  String? userUID;
  AppUser? currentUser;
  String? service;
  bool showScaffold = false;

  @override
  void initState() {
    super.initState();
    userUID = FirebaseAuth.instance.currentUser?.uid;
    DatabaseManagement.getUserByUid(userUID!).then((user) {
      setState(() {
        currentUser = user;
        service = user?.service;
        showScaffold = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (service == "Service Requester") {
      return ServiceRequesterMainPage();
    } else if (service == "Service Provider") {
      return ServiceProviderMainPage();
    } else {
      return showScaffold
          ? Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black87, Colors.black],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.handshake,
                  color: Colors.teal.shade500,
                  size: 70,
                ),
                SizedBox(height: 10.0),
                Text(
                  "WELCOME TO GIG!",
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Divider(
                    color: Colors.white,
                    thickness: 1.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hope you enjoy our app!",
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LET\'S GET STARTED!",
                        style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.schedule_send_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade400,
                    minimumSize: Size(350, 75),
                  ),
                  onPressed: () {
                    refreshData();
                  },
                ),
              ],
            ),
          ),
        ),
      )
          : Container();
    }
  }

  void refreshData() {
    DatabaseManagement.getUserByUid(userUID!).then((user) {
      setState(() {
        currentUser = user;
        service = user?.service;
      });
    });
  }
}
