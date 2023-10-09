import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gig/components/buttons/sign_up-button.dart';
import 'package:gig/components/elements/background-image.dart';
import 'package:gig/displays/submit-offer-page.dart';

import '../components/elements/service-details.dart';
import '../database/database-management.dart';
import '../model/user.dart';
import 'main-page.dart';

class ServiceDetailsPage extends StatefulWidget {
  final String image;
  final AppUser worker;
  final String serviceType;
  const ServiceDetailsPage({super.key, required this.worker, required this.image, required this.serviceType});

  @override
  ServiceDetailsPageState createState() => ServiceDetailsPageState();
}

class ServiceDetailsPageState extends State<ServiceDetailsPage> {
  @override
  void initState() {
    super.initState();
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
          child: Column(
            children: [
              BackgroundImage(size: 300, image: widget.image),
              ServiceDetails(
                  price: widget.worker.paymentHour,
                  location: widget.worker.location,
                  category: widget.serviceType,
                  description: widget.worker.workDescription,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal.shade400,
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SubmitOfferPage(
                      worker: widget.worker, serviceType: widget.serviceType)),
                  );},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 10),
                    Text('Create Offer'),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
