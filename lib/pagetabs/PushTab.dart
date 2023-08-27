import 'package:flutter/material.dart';
import 'package:gymapp/Tiles/Push_Tile.dart';

class PushTab extends StatelessWidget {
  final List<List<dynamic>> PushExercises;
  final Function(int) toggleFavorite;
  PushTab({required this.PushExercises, required this.toggleFavorite});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      itemCount: PushExercises.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.8),
      itemBuilder: (context, index) {
        return PushTile(
          name: PushExercises[index][0],
          reps: PushExercises[index][1],
          sets: PushExercises[index][2],
          weight: PushExercises[index][3],
          exColor: PushExercises[index][4],
          image: PushExercises[index][5],
          isFavorite: PushExercises[index][6],
          onFavoriteToggle: () => toggleFavorite(index),
        );
      },
    );
  }
}
