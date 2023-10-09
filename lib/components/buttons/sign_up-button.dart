import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final Function()? onPress;
  final String? name;
  final IconData? iconData;

  const SignUpButton({Key? key, required this.onPress, this.name, this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        key: Key("SignUpButton"),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.teal.shade400,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.teal.shade400),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null) // Check if an icon was provided
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 30,
                ),
              SizedBox(width: 10), // Add some spacing between the icon and text
              Text(
                name!,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins-Medium',
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
