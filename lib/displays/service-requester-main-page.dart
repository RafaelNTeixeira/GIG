import 'package:flutter/material.dart';
import 'package:gig/components/buttons/circular-avatar.dart';
import 'package:gig/components/buttons/gig-button.dart';
import 'package:gig/components/buttons/service-list-tile.dart';
import 'package:gig/components/buttons/side-bar.dart';
import 'package:gig/displays/profile-page.dart';
import 'package:gig/displays/requester-submited-offers-status-page.dart';
import 'package:gig/displays/workers-list-page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'about-page.dart';
import 'main-page.dart';


class ServiceRequesterMainPage extends StatefulWidget {
 ServiceRequesterMainPage({super.key});

  @override
  ServiceRequesterMainPageState createState() => ServiceRequesterMainPageState();
}

class ServiceRequesterMainPageState extends State<ServiceRequesterMainPage> {
  final searchController = TextEditingController();
  int _selectedIndex = 0;

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => RequesterSubmitedOffersStatus()),);
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
            key: Key("ServiceRequesterMainPage"),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        ServiceListTile(
                          icon: Icons.house_rounded,
                          serviceName: "House Cleaning",
                          description: 'Provides full house cleaning',
                          onPress: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "House Cleaning", image: 'lib/images/house-cleaning.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.bolt_rounded,
                          serviceName: "Electrician",
                          description: 'Get someone to fix an electric port',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Electrician", image: 'lib/images/electrician.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.water_drop_rounded,
                          serviceName: "Gardening",
                          description: 'Tidy up your garden! Make it look nice',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Gardening", image: 'lib/images/gardening.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.plumbing_rounded,
                          serviceName: "Plumbing",
                          description: 'Don\'t leave those tubes broken',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Plumbing", image: 'lib/images/plumbing.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.soup_kitchen_rounded,
                          serviceName: "Chef",
                          description: 'Eat the best dishes',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Chef", image: 'lib/images/chef.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.music_note_rounded,
                          serviceName: "Musician",
                          description: 'Listen to the best music',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Musician", image: 'lib/images/musician.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.book,
                          serviceName: "Teaching",
                          description: 'Get the best teaching lessons',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Teaching", image: 'lib/images/teaching.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.lock_clock_rounded,
                          serviceName: "Personal Trainer",
                          description: 'Have the best training session of your life',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Personal Trainer", image: 'lib/images/personal-trainer.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.computer_rounded,
                          serviceName: "Computer Technician",
                          description: 'Fix your computer problems',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Computer Technician", image: 'lib/images/computer-technician.jpg')),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        ServiceListTile(
                          icon: Icons.baby_changing_station_rounded,
                          serviceName: "Baby Sitting",
                          description: 'Get someone to take care of your baby',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkersPage(serviceType: "Baby Sitting", image: 'lib/images/baby-sitting.jpg')),
                            );
                          },
                        ),
                      ],
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

