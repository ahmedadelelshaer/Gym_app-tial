import 'package:flutter/material.dart';
import 'package:gymapp/screens/favorite_screen.dart';

class NavBar extends StatelessWidget {
  final List<List<dynamic>> pullExercises;
  final List<List<dynamic>> PushExercises;
  final List<String> favoriteExerciseNames;

  NavBar(
      {required this.pullExercises,
      required this.favoriteExerciseNames,
      required this.PushExercises});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Ahmed Adel"),
              accountEmail: Text("Bala7@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    "assets/gkgkyujufyjfyjf.jpeg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://w7.pngwing.com/pngs/929/974/png-transparent-blue-stripe-screenshot-blue-sky-daytime-sky-blue-background-blue-angle-other-thumbnail.png"),
                  fit: BoxFit.cover,
                ),
              )),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorites"),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteExerciseNames: favoriteExerciseNames,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
            onTap: () => null,
          ),
          // ... (other code)
        ],
      ),
    );
  }
}
