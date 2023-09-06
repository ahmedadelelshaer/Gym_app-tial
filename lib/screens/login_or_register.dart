import 'package:flutter/material.dart';
import 'package:gymapp/screens/LogIn.dart';
import 'package:gymapp/screens/register.dart';

class LogInOrSignUp extends StatefulWidget {
  const LogInOrSignUp({super.key});

  @override
  State<LogInOrSignUp> createState() => _LogInOrSignUpState();
}

class _LogInOrSignUpState extends State<LogInOrSignUp> {
  bool showLoginPage = true;
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogIn(
        onTap: togglePage,
      );
    } else {
      return register_screen(
        onTap: togglePage,
      );
    }
  }
}
