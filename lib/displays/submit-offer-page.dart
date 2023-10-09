import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gig/components/fillers/text-field.dart';
import '../database/database-management.dart';
import '../model/user.dart';
import 'main-page.dart';

class SubmitOfferPage extends StatefulWidget {
  final AppUser worker;
  final String? serviceType;
  const SubmitOfferPage({super.key, required this.worker, required this.serviceType});

  @override
  SubmitOfferPageState createState() => SubmitOfferPageState();
}

class SubmitOfferPageState extends State<SubmitOfferPage> {
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
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.teal.shade600,
                      size: 50,
                    ),

                    Text(
                      " WORKER'S INFO",
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
                        " ${widget.worker.name}",
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
                        " ${widget.worker.email}",
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
                      Icons.local_airport_rounded,
                      color: Colors.teal.shade400,
                      size: 40,
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        " ${widget.worker.location}",
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
                SizedBox(height: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.teal.shade600,
                      size: 40,
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        "WHERE DO YOU WANT THE SERVICE PROVIDER TO APPEAR?",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                BasicTextField(controller: locationController, hintText: "Location for the service provider to appear", obscureText: false, icon: Icons.pin_drop_rounded),
                SizedBox(height: 70.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal.shade400,
                    minimumSize: Size(double.infinity, 48),
                  ),
                  onPressed: () async {
                    await DatabaseManagement.sendOffer(
                        workerID: widget.worker.id,
                        requesterID: currentUser?.id,
                        name: currentUser?.name,
                        location: locationController.text,
                        email: currentUser?.email,
                        serviceType: widget.serviceType);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Offer submitted successfully!',
                          style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                          ),
                        ),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 10),
                      Text('Submit Offer'),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                    "Warning: For the best usability of the app, your name and email are going to be sent to the assigned worker",
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    color: Colors.white
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
