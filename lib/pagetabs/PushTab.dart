import 'package:flutter/material.dart';
import 'package:gymapp/Tiles/Push_Tile.dart';

class PushTab extends StatelessWidget {
  List PushExercises = [
    [
      "Incline Dumbell Press",
      "4 reps",
      "12 sets ",
      "20 kg",
      Colors.blue,
      "assets/incline_dumb.jpg"
    ],
    [
      "Flat Dumbeel Press",
      "4 reps",
      "12 sets ",
      "20 kg",
      Colors.red,
      "assets/dumbpress.jpeg"
    ],
    [
      "Triceps Ropedown",
      "4 reps",
      "12 sets ",
      "20 kg",
      Colors.green,
      "assets/triceps_exten.jpg"
    ],
    [
      "Shoulder Press",
      "4 reps",
      "12 sets ",
      "65 lb",
      Colors.yellow,
      "assets/shoulderpress.jpeg"
    ],
  ];
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
          );
        });
  }
}
