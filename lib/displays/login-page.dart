import 'package:flutter/material.dart';
import '../components/fillers/text-field.dart';
import '../components/buttons/sign_up-button.dart';
import '../logs/authentication.dart';
import '../main.dart';
import 'register-page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await _authService.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } finally {
      Navigator.pop(context);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: Key("LoginPage"),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome to GIG!',
                      style: TextStyle(
                        color: Colors.teal.shade400,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium',
                      ),
                    ),
                  ),
                  Text(
                    'Solve your life problems more easily',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins-Medium',
                    ),
                  ),
                  SizedBox(height: 30),
                  BasicTextField(
                    key: Key("emailField"),
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    icon: Icons.email_rounded,
                  ),
                  SizedBox(height: 30),
                  BasicTextField(
                    key: Key("passwordField"),
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icon: Icons.key,
                  ),
                  SizedBox(height: 25),
                  SignUpButton(
                    name: "LOGIN",
                    onPress: signIn,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.teal.shade400,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Register',
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
