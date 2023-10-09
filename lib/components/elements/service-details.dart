import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gig/components/buttons/sign_up-button.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ServiceDetails extends StatelessWidget {
  final String? price;
  final String? location;
  final String? category;
  final String? description;

  const ServiceDetails({
    super.key,
    this.price,
    this.location,
    this.category,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.euro_outlined,
                color: Colors.teal.shade400
              ),
              Text(
                '${price!}/h',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(width: 20.0),
              Icon(
                Icons.location_on,
                  color: Colors.teal.shade400
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: location ?? 'No location provided',
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        MapsLauncher.launchQuery(location!);
                      }),

                ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Text(
            category!,
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w400,
              fontSize: 30,
                color: Colors.teal.shade400
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            description!,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
                color: Colors.white
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
