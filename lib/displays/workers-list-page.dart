import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gig/components/buttons/worker-select.dart';
import 'package:gig/components/elements/background-image.dart';
import 'package:gig/database/database-management.dart';
import 'package:gig/displays/display-worker-info-page.dart';
import 'package:gig/displays/service-details-page.dart';
import 'package:gig/model/user.dart';

class WorkersPage extends StatefulWidget {
  final String serviceType;
  final String image;
  const WorkersPage({Key? key, required this.serviceType, required this.image}) : super(key: key);

  @override
  WorkersPageState createState() => WorkersPageState();
}

class WorkersPageState extends State<WorkersPage> {
  List<DocumentSnapshot<Object?>> workersList = [];

  @override
  void initState() {
    super.initState();
    DatabaseManagement.getProvidersByType(widget.serviceType).then((value) {
      setState(() {
        workersList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BackgroundImage(size: 200, image: widget.image),
              SizedBox(height: 20.0),
              Text(
                'Available Workers',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins-Medium',
                    color: Colors.teal.shade400),
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8,
                    children: List.generate(workersList.length, (index) {
                      var data = workersList[index].data() as Map<String, dynamic>;
                      var worker = AppUser.fromJson(data);
                      return Container(
                        child: WorkerSelect(
                          image: widget.image,
                          worker: worker,
                          serviceType: widget.serviceType,
                          onPress1: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => DisplayWorkerInfoPage(worker: worker)),
                            );},
                          name: worker.name,
                          nameStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                          ),
                          onPress2: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => ServiceDetailsPage(
                                      worker: worker,
                                      image: widget.image,
                                      serviceType: widget.serviceType)),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
