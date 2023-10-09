  import 'package:flutter/material.dart';
  import 'package:gig/components/buttons/circular-avatar.dart';
  import 'package:gig/displays/provider-accepted-finished-offers-page.dart';
  import 'package:gig/displays/requester-submited-offers-status-page.dart';
  import 'package:google_nav_bar/google_nav_bar.dart';
  import '../components/buttons/side-bar.dart';
  import '../database/database-management.dart';
  import '../model/user.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  
  import 'about-page.dart';
  import 'main-page.dart';
  
  class ProfilePage extends StatefulWidget {
    const ProfilePage({Key? key}) : super(key: key);
  
    @override
    _ProfilePageState createState() => _ProfilePageState();
  }
  
  class _ProfilePageState extends State<ProfilePage> {
    String? userUID;
    AppUser? currentUser;
    String? service;
    int _selectedIndex = 0;
  
    final _nameController = TextEditingController();
    final _ageController = TextEditingController();
    final _locationController = TextEditingController();
    final _biographyController = TextEditingController();
    final _workDescriptionController = TextEditingController();
    final _paymentHourController = TextEditingController();
  
    @override
    void initState() {
      super.initState();
      userUID = FirebaseAuth.instance.currentUser?.uid;
      DatabaseManagement.getUserByUid(userUID!).then((user) {
        setState(() {
          currentUser = user;
          service = user?.service;
          _nameController.text = currentUser?.name ?? '';
          _ageController.text = currentUser?.age ?? '';
          _locationController.text = currentUser?.location ?? '';
          _biographyController.text = currentUser?.biography ?? '';
          _workDescriptionController.text = currentUser?.workDescription ?? '';
          _paymentHourController.text = currentUser?.paymentHour ?? '';
        });
      });
    }
  
    @override
    Widget build(BuildContext context) {
      if (currentUser == null) {
        return const CircularProgressIndicator();
      } else
      if (service == "Service Provider") {
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
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.black],
              ),
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularAvatar(image: 'lib/images/avatar.jpg', image_radius: 80.0),
                      SizedBox(height: 30.0),
                      TextFormField(
                        controller: _nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'N A M E',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _ageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'A G E',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          hintText: 'Enter your age',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _locationController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'L O C A T I O N',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                          hintText: 'Enter your location',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _biographyController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'B I O G R A P H Y',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          hintText: 'Enter your biography',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _workDescriptionController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'W O R K   D E S C R I P T I O N',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          hintText: 'Enter your work description',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _paymentHourController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'P A Y M E N T / H O U R',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          hintText: 'Enter your payment/hour',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final id = await DatabaseManagement.getCurrentUserDocId(userUID!);
                          final offers = await DatabaseManagement.getReceivedOffers(currentUser!.id);
                          DatabaseManagement.updateProfileProvider(
                            id: id,
                            name: _nameController.text,
                            age: _ageController.text,
                            location: _locationController.text,
                            biography: _biographyController.text,
                            workDescription: _workDescriptionController.text,
                            paymentHour: _paymentHourController.text,
                            offers: offers,
                          );
                          setState(() {
                            currentUser?.name = _nameController.text;
                            currentUser?.age = _ageController.text;
                            currentUser?.location = _locationController.text;
                            currentUser?.biography = _biographyController.text;
                            currentUser?.workDescription = _workDescriptionController.text;
                            currentUser?.paymentHour = _paymentHourController.text;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Profile updated successfully!',
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'SAVE CHANGES',
                          style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      else {
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
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.black],
              ),
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularAvatar(image: 'lib/images/avatar.jpg', image_radius: 80.0),
                      SizedBox(height: 40.0),
                      TextFormField(
                        controller: _nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'N A M E',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _ageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'A G E',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your age',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _biographyController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.teal.shade500,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.teal.shade500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                          ),
                          labelText: 'B I O G R A P H Y',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your biography',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(200, 50),
                        ),
                        onPressed: () async {
                          final id = await DatabaseManagement.getCurrentUserDocId(userUID!);
                          DatabaseManagement.updateProfileRequester(
                            id: id,
                            name: _nameController.text,
                            age: _ageController.text,
                            location: _locationController.text,
                            biography: _biographyController.text,
                            workDescription: _workDescriptionController.text,
                            paymentHour: _paymentHourController.text,
                          );
                          setState(() {
                            currentUser?.name = _nameController.text;
                            currentUser?.age = _ageController.text;
                            currentUser?.location = _locationController.text;
                            currentUser?.biography = _biographyController.text;
                            currentUser?.workDescription = _workDescriptionController.text;
                            currentUser?.paymentHour = _paymentHourController.text;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Profile updated successfully!',
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'SAVE CHANGES',
                          style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
  }
