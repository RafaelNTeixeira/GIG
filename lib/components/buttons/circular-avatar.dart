// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String? image;
  final double? image_radius;
  final Function? onPress;

  const CircularAvatar({super.key, this.onPress, this.image, this.image_radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {onPress!();},
      child: CircleAvatar(
        radius: image_radius!,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundImage: AssetImage(
            image!,
          ),
          backgroundColor: Colors.grey.shade100,
          radius: image_radius! - 1.0,
        ),
      ),
    );
  }
}