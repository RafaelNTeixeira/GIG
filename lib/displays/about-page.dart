import 'package:flutter/material.dart';
import 'package:gig/displays/profile-page.dart';
import 'package:gig/displays/requester-submited-offers-status-page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../components/buttons/side-bar.dart';
import 'main-page.dart';

class AboutPage extends StatefulWidget {
  AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  final searchController = TextEditingController();
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          padding: EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
                break;
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()),);
                break;
              default:
                break;
            }
          },
          tabs: [
            GButton(icon: Icons.home),
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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "A B O U T   G I G",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Poppins-Medium',
                        color: Colors.teal.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.teal.shade50,
                        thickness: 3.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "GIG was created in the hope of helping people's daily problems in a more efficient and simple way.\n"
                          "With a few touches, we can get someone with experience to solve your problems at a place of your own preference",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      "OUR CORE VALUES",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins-Medium',
                        color: Colors.teal.shade400,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.teal.shade50,
                        thickness: 3.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.groups,
                                color: Colors.teal.shade200,
                                size: 30,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Authentically serve our customers by empowering, listening, and collaborating with our fellow users",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Medium',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.business_center_rounded,
                                color: Colors.teal.shade200,
                                size: 30,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Deliver the best service possible. Making our customers happy is our highest priority",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Medium',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.signal_cellular_alt_outlined,
                                color: Colors.teal.shade200,
                                size: 30,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Adopt a Growth Mindset. Be curious and eager to learn. Aim for ethical, sustainable, long-term growth",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Medium',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      "D E V E L O P E R S",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins-Medium',
                        color: Colors.teal.shade400,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.teal.shade50,
                        thickness: 3.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                            "O  Rafael Teixeira - up202108831@up.pt\n"
                            "O  Xavier Outeiro - up202108895@up.pt\n"
                            "O  Bruno Duvane - up202109244@up.pt\n"
                            "O  Eduardo Oliveira - up202108690@up.pt\n",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
