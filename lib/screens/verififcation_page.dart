import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utilites/dialog.dart/dialog.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  void resendVerificationEmail(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Verification Email Sent"),
            content:
                Text("A verification email has been resent to your inbox."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Verification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "An email has been sent to your inbox. Please check your email and verify your account.",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => resendVerificationEmail(context),
              child: Text("Resend Verification Email"),
            ),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.reload(); // Reload user data
                if (user != null && user.emailVerified) {
                  // Email is verified, navigate to the Gym Page.
                  Navigator.of(context).pushReplacementNamed('/gympage');
                } else {
                  dialog(
                      context, "Email isn't verified", "An error has occurred");
                }
              },
              child: Text("Go to Gym Page"),
            ),
          ],
        ),
      ),
    );
  }
}
