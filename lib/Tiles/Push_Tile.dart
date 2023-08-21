import 'package:flutter/material.dart';

class PushTile extends StatefulWidget {
  final String name;
  final String sets;
  final String reps;
  final String weight;
  final exColor;
  final String image;

  const PushTile({
    Key? key,
    required this.name,
    required this.reps,
    required this.sets,
    required this.weight,
    required this.exColor,
    required this.image,
  }) : super(key: key);

  @override
  _PushTileState createState() => _PushTileState();
}

class _PushTileState extends State<PushTile> {
  int no = 0; // Counter for each exercise

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.exColor[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.name),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Image.asset(widget.image),
            ),
            Text(
              widget.reps,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(widget.sets),
            const SizedBox(
              height: 12,
            ),
            Text(
              "You did this exercise $no times",
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      no++; // Increment the counter
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
