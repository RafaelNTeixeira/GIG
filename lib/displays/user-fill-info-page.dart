import 'package:flutter/material.dart';
import 'package:gig/components/buttons/side-bar.dart';
import 'package:gig/components/buttons/sign_up-button.dart';
import 'package:gig/components/fillers/text-field.dart';
import 'package:gig/database/database-management.dart';
import 'package:gig/displays/login-page.dart';
import 'package:gig/displays/main-page.dart';
import '../components/buttons/circular-avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../database/database-management.dart';

import '../logs/authentication.dart';
import '../model/user.dart';

class FillUserInfoPage extends StatefulWidget {
  final String uid;
  const FillUserInfoPage({super.key, required this.uid});


  @override
  FillUserInfoPageState createState() => FillUserInfoPageState();
}

class FillUserInfoPageState extends State<FillUserInfoPage> {
  final AuthService _authService = AuthService();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final biographyController = TextEditingController();
  final workDescriptionController = TextEditingController();
  final locationController = TextEditingController();
  final paymentHourController = TextEditingController();
  final workerController = TextEditingController();

  String selectedService = "Service Requester";
  bool value1 = false; bool value2 = false; bool value3 = false;
  bool value4 = false; bool value5 = false; bool value6 = false;
  bool value7 = false; bool value8 = false; bool value9 = false;
  bool value10 = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularAvatar(
                          onPress: () {},
                          image: 'lib/images/avatar.jpg',
                          image_radius: 60.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      BasicTextField(limit: 15, controller: nameController, hintText: 'Name', obscureText: false, icon: Icons.person),
                      SizedBox(height: 15.0),
                      BasicTextField(limit: 2, controller: ageController, hintText: 'Age', obscureText: false, icon: Icons.timelapse_rounded),
                      SizedBox(height: 15.0),
                      BasicTextField(controller: biographyController, hintText: 'Biography', obscureText: false, icon: Icons.pending_rounded),
                      SizedBox(height: 25.0),
                      Text(
                        'Type of Service',
                        style: TextStyle(
                          color: Colors.teal.shade400,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 87, vertical: 5),
                              child:DropdownButton(
                                hint: Text(selectedService),
                                onChanged: (changedValue) {
                                  selectedService = changedValue!;
                                  setState(() {
                                    selectedService;
                                  });
                                },
                                value: selectedService,
                                items: <String>['Service Requester', 'Service Provider']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                        value,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Medium',
                                      ),
                                    ),
                                  );
                                }).toList(),
                                underline: SizedBox(),
                                style: TextStyle(fontSize: 17, color: Colors.black54),
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.black, //Icon color
                              ),
                          ),
                        ),
                      if (selectedService == "Service Provider")
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            height: 250,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.indigo.shade300,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.house_rounded, color: Colors.teal.shade400),
                                    title: Text('House Cleaning', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value1,
                                    onChanged: (bool? value) {
                                      setState(() {value1 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.electric_bolt_rounded, color: Colors.teal.shade400),
                                    title: Text('Electrician', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value2,
                                    onChanged: (bool? value) {
                                      setState(() {value2 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.water_drop_rounded, color: Colors.teal.shade400),
                                    title: Text('Gardening', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value3,
                                    onChanged: (bool? value) {setState(() {value3 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.plumbing_rounded, color: Colors.teal.shade400),
                                    title: Text('Plumbing', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value4,
                                    onChanged: (bool? value) {setState(() {value4 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.soup_kitchen_rounded, color: Colors.teal.shade400),
                                    title: Text('Chef', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value5,
                                    onChanged: (bool? value) {setState(() {value5 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.music_note_rounded, color: Colors.teal.shade400),
                                    title: Text('Musician', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value6,
                                    onChanged: (bool? value) {setState(() {value6 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.book, color: Colors.teal.shade400),
                                    title: Text('Teaching', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value7,
                                    onChanged: (bool? value) {setState(() {value7 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.lock_clock, color: Colors.teal.shade400),
                                    title: Text('Personal Trainer', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value8,
                                    onChanged: (bool? value) {setState(() {value8 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.computer_rounded, color: Colors.teal.shade400),
                                    title: Text('Computer Technician', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value9,
                                    onChanged: (bool? value) {setState(() {value9 = value!;});
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    activeColor: Colors.teal.shade400,
                                    secondary: Icon(Icons.baby_changing_station_rounded, color: Colors.teal.shade400),
                                    title: Text('Baby Sitting', style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins-Medium',
                                    ),),
                                    value: value10,
                                    onChanged: (bool? value) {setState(() {value10 = value!;});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (selectedService == "Service Provider") BasicTextField(controller: workDescriptionController, hintText: 'Describe your work', obscureText: false, icon: Icons.work),
                      SizedBox(height: 15.0),
                      if (selectedService == "Service Provider") BasicTextField(controller: locationController, hintText: 'Location', obscureText: false, icon: Icons.location_on),
                      SizedBox(height: 15.0),
                      if (selectedService == "Service Provider") BasicTextField(controller: paymentHourController, hintText: 'Payment/Hour', obscureText: false, icon: Icons.money),
                      if (selectedService == "Service Provider") SizedBox(height: 30.0),
                      SizedBox(height: 15.0),
                      SignUpButton(name: 'CONTINUE', onPress: () async {
                        final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('user').where('uid', isEqualTo: widget.uid).get();
                        String id = snapshot.docs.first.id;
                        Map<String, bool> tasks = {
                          'House Cleaning': value1, 'Electrician': value2, 'Gardening': value3,
                          'Plumbing': value4, 'Chef': value5, 'Musician': value6, 'Teaching': value7,
                          'Personal Trainer': value8, 'Computer Technician': value9, 'Baby Sitting': value10
                        };

                        DatabaseManagement.updateUser(id: id, name: nameController.text,
                            age: ageController.text,
                            biography: biographyController.text,
                            service: selectedService,
                            workDescription: workDescriptionController.text,
                            location: locationController.text,
                            paymentHour: paymentHourController.text,
                            tasks: tasks).then((value) {
                              _authService.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
                        ));});
                        },
                      ),
                      if (selectedService == "Service Provider") SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
