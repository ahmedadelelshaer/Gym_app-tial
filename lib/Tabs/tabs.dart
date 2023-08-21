import 'package:flutter/material.dart';

class Mytabs extends StatelessWidget {
  final String IconPath;
  const Mytabs({super.key, required this.IconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          IconPath,
        ),
      ),
    );
  }
}
