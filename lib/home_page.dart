import 'package:flutter/material.dart';
import 'package:gymapp/Tabs/tabs.dart';
import 'package:gymapp/pagetabs/LegTab.dart';
import 'package:gymapp/pagetabs/PullTab.dart';
import 'package:gymapp/pagetabs/PushTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    //push tab

    //pull tab

    //leg tab
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mytabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 36,
                ),
                onPressed: () {},
              )),
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
                )),
          ],
        ),
        body: Column(children: [
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
              PullTab(),
              PushTab(),
              LegTab(),
            ],
          ))
        ]),
      ),
    );
  }
}
