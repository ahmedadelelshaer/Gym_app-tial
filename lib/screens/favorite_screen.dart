import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favoriteExerciseNames;

  FavoritesScreen({required this.favoriteExerciseNames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: ListView.builder(
        itemCount: favoriteExerciseNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteExerciseNames[index]),
          );
        },
      ),
    );
  }
}
