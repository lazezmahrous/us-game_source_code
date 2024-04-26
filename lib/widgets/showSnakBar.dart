import 'package:flutter/material.dart';


void showSnackBar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text(
      message,
      style: const TextStyle(
      ),
    ),
  ));
}


void showSnackBarBlue(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            // fontFamily: 'GED',
            ),
      ),
      backgroundColor: Colors.blue[400],
    ),
  );
}
