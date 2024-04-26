import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildQuestion(
    String question, String punishment, String publishedBy, Timestamp data) {
  DateTime dateTime = data.toDate(); // Convert Timestamp to DateTime

  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            question,
            style: TextStyle(
              fontSize: maxWidth * .04,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'العقاب',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
          ),
        ),
        Text(
          punishment,
          style: const TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          'تم النشر بواسطه @ : $publishedBy',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
        Text(
          DateFormat('EEE, h:mm a', 'ar').format(dateTime),
          style: const TextStyle(fontSize: 10, color: Colors.black38),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  });
}
