import 'package:flutter/material.dart';

Future<void> dialog(BuildContext context, String text1, String text2) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text2),
          content: Text(text1),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
