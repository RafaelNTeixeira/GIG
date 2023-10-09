import 'package:flutter/material.dart';

class OfferDisplay extends StatelessWidget {
  final String? name;
  final String? location;
  final String? email;
  final String? serviceType;
  final String? status;
  final VoidCallback? onPress;

  OfferDisplay({Key? key, this.name, this.location, this.email, this.serviceType, required this.onPress, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress!,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.teal.shade400,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.teal.shade400,
                decorationColor: Colors.teal.shade400,
                decorationThickness: 2.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: $location',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Email: $email',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '$serviceType',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: Colors.teal.shade400,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Status: $status',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
