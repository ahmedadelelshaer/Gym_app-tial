import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:gymapp/utilites/dialog.dart/my_buttons.dart';
import 'package:gymapp/utilites/dialog.dart/style_square.dart';
import 'package:gymapp/utilites/dialog.dart/dialog.dart';

class LogIn extends StatefulWidget {
  final Function()? onTap;
  const LogIn({super.key, required this.onTap});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        dialog(context, "User not found", "An error occured");
      } else if (e.code == 'wrong-password') {
        dialog(context, "Password is incorrect", "An error occured");
      } else if (e.code == 'invalid-email') {
        dialog(context, "Invalid Email", "An error occured");
      } else {
        dialog(context, e.code.toString(), "An error occured");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/gymlogo2.png",
                    width: 75,
                    height: 75,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Welcome back to gymraty !",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: emailController,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Please type your email"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: passwordController,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Please type your password"),
                    ),
                  ),
                  MyButton(onTap: signin, text: "Sign in"),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Or continue with ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: SquareTile(imagePath: "assets/googlelogo.jpg"),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SquareTile(imagePath: "assets/applelogo.png")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap, // Use widget.onTap here
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
