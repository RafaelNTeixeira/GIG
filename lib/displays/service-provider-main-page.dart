import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gig/components/buttons/circular-avatar.dart';
import 'package:gig/components/buttons/side-bar.dart';
import 'package:gig/displays/profile-page.dart';
import 'package:gig/displays/provider-accepted-finished-offers-page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../components/buttons/gig-button.dart';
import '../database/database-management.dart';
import '../model/user.dart';
import '../components/buttons/offer-display.dart';
import 'about-page.dart';
import 'accept-decline-offer-page.dart';
import 'main-page.dart';


class ServiceProviderMainPage extends StatefulWidget {
  ServiceProviderMainPage({super.key});

  @override
  ServiceProviderMainPageState createState() => ServiceProviderMainPageState();
}

class ServiceProviderMainPageState extends State<ServiceProviderMainPage> {
  final searchController = TextEditingController();
  int _selectedIndex = 0;
  String? userUID;
  AppUser? currentUser;
  List<Map<String, dynamic>> offersList = [];

  @override
  void initState() {
    super.initState();
    userUID = FirebaseAuth.instance.currentUser?.uid;
    _fetchOffersList();
  }

  Future<void> _fetchOffersList() async {
    currentUser = await DatabaseManagement.getUserByUid(userUID!);
    if (mounted && currentUser != null) {
      final value = await DatabaseManagement.getReceivedOffersByStatus(currentUser!.id, "Not checked");
      if (mounted) {
        setState(() {
          offersList = value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
          gap: 8,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
            switch(index) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()),);
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderAcceptedFinishedOffersPage()),);
                break;
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
                break;
              case 3:
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()),);
                break;
              default:
                break;
            }
          },
          tabs: [
            GButton(icon: Icons.home),
            GButton(icon: Icons.task_rounded),
            GButton(icon: Icons.person),
            GButton(icon: Icons.book),
          ],
        ),
      ),
      drawer: SideBarMenu(),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GIGButton(
                        onPress: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SideBarMenu()),
                          );
                        },
                    ),
                    CircularAvatar(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      image: 'lib/images/avatar.jpg',
                      image_radius: 30.0,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.0),
                    Text(
                      'Available Offers',
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.teal.shade400,
                          fontSize: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.local_offer_rounded,
                      color: Colors.teal.shade400,
                      size: 25,
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Divider(
                    color: Colors.white,
                    thickness: 1.0,
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: Scrollbar(
                    child: offersList.length == 0 ? Text(
                        'No offers available',
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                            fontSize: 25
                        ),
                    ) : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 2,
                      ),
                      itemCount: offersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var offerData = offersList[index];
                        var offerKey = offerData['offer'];

                        return OfferDisplay(
                          name: offerData['name'],
                          email: offerData['email'],
                          location: offerData['location'],
                          status: offerData['status'],
                          serviceType: offerData['serviceType'],
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AcceptDeclineOfferPage(
                                  workerID: currentUser!.id,
                                  offerKey: offerKey,
                                  name: offerData['name'],
                                  email: offerData['email'],
                                  location: offerData['location'],
                                  serviceType: offerData['serviceType']
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

