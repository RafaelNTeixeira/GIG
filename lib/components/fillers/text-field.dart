import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final int? limit;

  const BasicTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon, this.limit
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        inputFormatters: [
            LengthLimitingTextInputFormatter(limit),
        ],
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade400),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins-Medium',
          ),
          prefixIcon: Icon(
              icon!,
            color: Colors.teal.shade400,
          ),
        ),
      ),
    );
  }
}
