import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gig/components/fillers/text-field.dart';
import 'package:gig/displays/provider-accepted-finished-offers-page.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../database/database-management.dart';
import '../model/user.dart';
import 'main-page.dart';

class FinishOfferPage extends StatefulWidget {
  final String workerID;
  final String offerKey;
  final String name;
  final String email;
  final String location;
  final String serviceType;

  FinishOfferPage(
      {super.key,
        required this.name,
        required this.email,
        required this.location,
        required this.serviceType,
        required this.workerID,
        required this.offerKey});

  @override
  FinishOfferPageState createState() => FinishOfferPageState();
}

class FinishOfferPageState extends State<FinishOfferPage> {
  final locationController = TextEditingController();
  String? userUID;
  AppUser? currentUser;

  @override
  void initState() {
    super.initState();
    userUID = FirebaseAuth.instance.currentUser?.uid;
    DatabaseManagement.getUserByUid(userUID!).then((user) {
      setState(() {
        currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.teal.shade500,
                      size: 50,
                    ),
                    Text(
                      " OFFER'S INFO",
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      color: Colors.teal.shade400,
                      size: 40,
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        "${widget.name}",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Icon(
                      Icons.mail_lock_rounded,
                      color: Colors.teal.shade400,
                      size: 40,
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        "${widget.email}",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Icon(
                      Icons.task,
                      color: Colors.teal.shade400,
                      size: 40,
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        "${widget.serviceType}",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.work,
                      color: Colors.teal.shade500,
                      size: 50,
                    ),
                    Text(
                      " JOB LOCATION",
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.teal.shade400,
                      size: 40,
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.location,
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 20,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    MapsLauncher.launchQuery(widget.location);
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        DatabaseManagement.updateOfferStatus(workerID: widget.workerID, offerKey: widget.offerKey, newStatus: "Finished");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderAcceptedFinishedOffersPage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            'F I N I S H',
                            style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.flag,
                            size: 20,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade400,
                        minimumSize: Size(350, 75),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
