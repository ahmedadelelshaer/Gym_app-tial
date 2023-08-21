import 'package:flutter/material.dart';

class PullTile extends StatefulWidget {
  final String name;
  final String sets;
  final String reps;
  final String weight;
  final exColor;
  final String image;

  const PullTile({
    super.key,
    required this.name,
    required this.reps,
    required this.sets,
    required this.weight,
    required this.exColor,
    required this.image,
  });
  @override
  State<PullTile> createState() => PullTileState();
}

class PullTileState extends State<PullTile> {
  int no = 0;
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(widget.name),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
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
            Text(widget.weight),
            Text(
              "You did this ex $no times",
              style: TextStyle(fontSize: 12),
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
                        no++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
