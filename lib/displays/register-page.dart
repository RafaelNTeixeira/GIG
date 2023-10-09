import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gig/database/database-management.dart';
import 'package:gig/displays/user-fill-info-page.dart';
import '../components/fillers/text-field.dart';
import '../components/buttons/sign_up-button.dart';
import '../logs/authentication.dart';
import '../main.dart';
import 'login-page.dart';
import 'main-page.dart';
import 'register-page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key,}) : super(key:key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await _authService.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } finally {
      Navigator.pop(context);
    }

    String uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseManagement.createUser(uid: uid, email: emailController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => FillUserInfoPage(uid: uid)));
  }

  void signInUser() {}

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
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Get into GIG!',
                      style: TextStyle(
                        color: Colors.teal.shade400,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium',
                      ),
                    ),
                  ),
                  Text(
                    'One step closer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins-Medium',
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: emailController,
                      cursorColor: Colors.teal.shade400,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.teal.shade400,
                          fontFamily: 'Poppins-Medium'
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => email == null ? 'Enter a valid email' : null,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      cursorColor: Colors.teal.shade400,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.teal.shade400,
                          fontFamily: 'Poppins-Medium'
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min. 6 characters'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SignUpButton(name: "REGISTER", onPress: signUp,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.teal.shade400,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
                          );},
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}