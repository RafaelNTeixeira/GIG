import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final double? size;
  final String? image;

  const BackgroundImage({
    super.key,
    this.size,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Image.asset(
            image!,
            height: size!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(40),
              color: Colors.white
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}