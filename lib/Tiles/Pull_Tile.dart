import 'package:flutter/material.dart';

class PullTile extends StatefulWidget {
  final String name;
  final String sets;
  final String reps;
  final String weight;
  final exColor;
  final String image;
  final bool isFavorite; // Add this parameter
  final VoidCallback onFavoriteToggle; // Add this parameter

  const PullTile({
    Key? key,
    required this.name,
    required this.reps,
    required this.sets,
    required this.weight,
    required this.exColor,
    required this.image,
    required this.isFavorite, // Initialize isFavorite
    required this.onFavoriteToggle, // Initialize onFavoriteToggle
  }) : super(key: key);

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
                IconButton(
                  onPressed: widget.onFavoriteToggle, // Toggle favorite status
                  icon: Icon(
                    Icons.favorite,
                    color: widget.isFavorite ? Colors.red : Colors.grey,
                  ),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
