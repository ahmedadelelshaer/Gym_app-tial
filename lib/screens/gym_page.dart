import 'package:flutter/material.dart';
import 'package:gymapp/Tabs/tabs.dart';
import 'package:gymapp/constants/exercies.dart';
import 'package:gymapp/provider/navbar.dart';
import 'package:gymapp/pagetabs/LegTab.dart';
import 'package:gymapp/pagetabs/PullTab.dart';
import 'package:gymapp/pagetabs/PushTab.dart';

class GymPage extends StatefulWidget {
  const GymPage({super.key});

  @override
  State<GymPage> createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> {
  List<Widget> mytabs = [
    Mytabs(
      IconPath: "assets/Pull_Main.jpg",
    ),
    Mytabs(
      IconPath: "assets/Push_Main.jpeg",
    ),
    Mytabs(
      IconPath: "assets/Leg_Main.jpg",
    ),
  ];

  List<String> favoriteExerciseNames = [];

  void toggleFavorite_pull(int index) {
    setState(() {
      ExerciseDataSource.pullExercises[index][6] =
          !ExerciseDataSource.pullExercises[index][6];
      if (ExerciseDataSource.pullExercises[index][6]) {
        favoriteExerciseNames.add(ExerciseDataSource.pullExercises[index][0]);
      } else {
        favoriteExerciseNames
            .remove(ExerciseDataSource.pullExercises[index][0]);
      }
    });
  }

  void toggleFavorite_push(int index) {
    setState(() {
      ExerciseDataSource.PushExercises[index][6] =
          !ExerciseDataSource.PushExercises[index][6];
      if (ExerciseDataSource.PushExercises[index][6]) {
        favoriteExerciseNames.add(ExerciseDataSource.PushExercises[index][0]);
      } else {
        favoriteExerciseNames
            .remove(ExerciseDataSource.PushExercises[index][0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mytabs.length,
      child: Scaffold(
        drawer: NavBar(
          pullExercises: ExerciseDataSource.pullExercises,
          favoriteExerciseNames: favoriteExerciseNames,
          PushExercises: ExerciseDataSource.PushExercises,
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 36,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 36.0),
              child: Row(
                children: const [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "EXERCISE",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TabBar(tabs: mytabs),
            Expanded(
              child: TabBarView(
                children: [
                  PullTab(
                    pullExercises: ExerciseDataSource.pullExercises,
                    toggleFavorite: toggleFavorite_pull,
                  ),
                  PushTab(
                    PushExercises: ExerciseDataSource.PushExercises,
                    toggleFavorite: toggleFavorite_push,
                  ),
                  LegTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
