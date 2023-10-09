import 'package:flutter/material.dart';

class GIGButton extends StatelessWidget {
  final Function? onPress;

  const GIGButton({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("GIGButton"),
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {onPress!();},
        child: Text(
          'GIG',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'Poppins-Medium',
            color: Colors.teal.shade400,
          ),
        ),
      ),
    );
  }
}