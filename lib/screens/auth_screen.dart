import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/screens/gym_page.dart';
import 'package:gymapp/screens/LogIn.dart';
import 'package:gymapp/screens/login_or_register.dart';
import 'package:gymapp/screens/verififcation_page.dart'; // Import the verification page

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user != null) {
            // Check if email is verified
            if (user.emailVerified) {
              return const GymPage();
            } else {
              // If email is not verified, redirect to the verification page
              return const VerificationPage();
            }
          } else {
            return const LogInOrSignUp();
          }
        },
      ),
    );
  }
}
