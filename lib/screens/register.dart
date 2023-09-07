import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilites/dialog.dart/my_buttons.dart';
import '../utilites/dialog.dart/style_square.dart';
import '../utilites/dialog.dart/dialog.dart';

class register_screen extends StatefulWidget {
  final Function()? onTap;
  const register_screen({super.key, required this.onTap});

  @override
  State<register_screen> createState() => register_screenState();
}

class register_screenState extends State<register_screen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final firstNamecont = TextEditingController();
  final agecont = TextEditingController();
  final lastNamecont = TextEditingController();
  final weightcont = TextEditingController();
  final heightcont = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    firstNamecont.dispose();
    agecont.dispose();
    lastNamecont.dispose();
    weightcont.dispose();
    heightcont.dispose();
    super.dispose();
  }

  void signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();
    final firstName = firstNamecont.text.trim();
    final lastName = lastNamecont.text.trim();
    final ageText = agecont.text.trim();
    final weightText = weightcont.text.trim();
    final heightText = heightcont.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        ageText.isEmpty ||
        weightText.isEmpty ||
        heightText.isEmpty) {
      dialog(context, "Please fill in all fields", "An error occurred");
      return;
    }

    if (password != confirmPassword) {
      dialog(context, "Passwords don't match", "An error occurred");
      return;
    }

    int age, weight, height;
    try {
      age = int.parse(ageText);
      weight = int.parse(weightText);
      height = int.parse(heightText);
    } catch (e) {
      dialog(context, "Age, weight, and height must be integers",
          "An error occurred");
      return;
    }

    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await authResult.user!.sendEmailVerification();

      dialog(
          context,
          "User is successfully created. Please check your email to verify your account",
          "Congrats!");

      // Redirect to the verification page
      Navigator.of(context).pushReplacementNamed('/verification');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        dialog(context, "Email is already used", "An error occurred");
      } else if (e.code == 'weak-password') {
        dialog(context, "Password is weak", "An error occurred");
      } else if (e.code == 'invalid-email') {
        dialog(context, "Invalid Email", "An error occurred");
      } else {
        dialog(context, "Registration error", "An error occurred");
      }
    }
  }

  Future addUserDetails(String firstName, String lastName, int age, int weight,
      int height) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'First Name': firstName,
      'Last Name': lastName,
      'Age': age,
      'Weight': weight,
      'Height': height,
    });
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
                  Text("Register here !",
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
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: confirmpasswordController,
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
                          hintText: "Please confirm your password"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: firstNamecont,
                      enableSuggestions: false,
                      autocorrect: false,
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
                          hintText: "First Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: lastNamecont,
                      enableSuggestions: false,
                      autocorrect: false,
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
                          hintText: "Last Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: agecont,
                      enableSuggestions: false,
                      autocorrect: false,
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
                          hintText: "Age"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: weightcont,
                      enableSuggestions: false,
                      autocorrect: false,
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
                          hintText: "Weight"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextField(
                      controller: heightcont,
                      enableSuggestions: false,
                      autocorrect: false,
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
                          hintText: "Height"),
                    ),
                  ),
                  MyButton(
                    onTap: signup,
                    text: "Register",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap, // Use widget.onTap here
                        child: const Text(
                          ' Login now',
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
