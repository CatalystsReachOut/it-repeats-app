import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Widget selectOptions(String type) {
  type = type.toLowerCase();

  return GestureDetector(
    child: Stack(
      children: [
        Image(
          image: AssetImage('assets/select-$type.png'),
        ),
        Positioned(
          left: 12,
          top: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select",
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                type.capitalize(),
                textScaleFactor: 1.0,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    ),
    onTap: () {},
    onLongPress: () {
      Fluttertoast.showToast(msg: "Select ${type.capitalize()}");
    },
  );
}
