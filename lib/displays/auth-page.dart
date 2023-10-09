import 'package:flutter/cupertino.dart';
import 'package:gig/displays/register-page.dart';

import 'login-page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin ? LoginPage() : RegisterPage();

  void toggle() => setState(() => isLogin = !isLogin);
}