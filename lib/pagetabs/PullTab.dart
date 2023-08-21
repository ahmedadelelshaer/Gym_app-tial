import 'package:flutter/material.dart';
import 'package:gymapp/Tiles/Pull_Tile.dart';

class PullTab extends StatelessWidget {
  List pullExercises = [
    [
      "Lat PullDown",
      "4 reps",
      "12 sets ",
      "120 lb",
      Colors.blue,
      "assets/latpulldown.jpg"
    ],
    [
      "Cable Row  ",
      "4 reps",
      "12 sets ",
      "120 lb",
      Colors.red,
      "assets/cablerow.jpg"
    ],
    [
      "Rear Delt Fly",
      "4 reps",
      "12 sets ",
      "150 lb",
      Colors.yellow,
      "assets/reardelt.jpg"
    ],
    [
      "Barbell Biceps Curl",
      "4 reps",
      "12 sets ",
      "20 kg",
      Colors.green,
      "assets/bar.jpg"
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.8),
      itemCount: pullExercises.length,
      itemBuilder: (context, index) {
        return PullTile(
          name: pullExercises[index][0],
          reps: pullExercises[index][1],
          sets: pullExercises[index][2],
          weight: pullExercises[index][3],
          exColor: pullExercises[index][4],
          image: pullExercises[index][5],
        );
      },
    );
  }
}
