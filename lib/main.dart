import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/screens/LogIn.dart';
import 'package:gymapp/screens/auth_screen.dart';
import 'package:gymapp/screens/gym_page.dart';
import 'package:gymapp/screens/register.dart';
import 'package:gymapp/screens/verififcation_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
        routes: {
          '/verification': (context) => const VerificationPage(),
          '/gympage': (context) => const GymPage(),
        });
  }
}
