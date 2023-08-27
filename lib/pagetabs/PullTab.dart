import 'package:flutter/material.dart';
import '../Tiles/Pull_Tile.dart';

class PullTab extends StatelessWidget {
  final List<List<dynamic>> pullExercises;
  final Function(int) toggleFavorite;

  PullTab({required this.pullExercises, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.8,
      ),
      itemCount: pullExercises.length,
      itemBuilder: (context, index) {
        return PullTile(
          name: pullExercises[index][0],
          reps: pullExercises[index][1],
          sets: pullExercises[index][2],
          weight: pullExercises[index][3],
          exColor: pullExercises[index][4],
          image: pullExercises[index][5],
          isFavorite: pullExercises[index][6],
          onFavoriteToggle: () => toggleFavorite(index),
        );
      },
    );
  }
}
