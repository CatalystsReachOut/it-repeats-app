import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_repeats/features/presentation/pages/ShowOptionsPage.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Widget selectOptions(
    BuildContext context,
    String type,
    List<String> optionsList,
    String holdingVariable,
    ChangeManager changeManager) {
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
        Positioned(
          left: 12,
          bottom: 12,
          child: Container(
            // width: 130,
            constraints: const BoxConstraints(maxWidth: 130),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(34, 34, 34, 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Text(
              holdingVariable,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ],
    ),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShowOptionsPage(
            listOfOptions: optionsList,
            choose: type,
            changeManager: changeManager,
          ),
        ),
      );
    },
    onLongPress: () {
      Fluttertoast.showToast(msg: "Select ${type.capitalize()}");
    },
  );
}
