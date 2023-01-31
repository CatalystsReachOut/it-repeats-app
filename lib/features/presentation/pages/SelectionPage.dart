import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_repeats/features/presentation/pages/ShowOptionsPage.dart';
import 'package:it_repeats/features/presentation/widgets/SelectOptionsWidget.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 34, 24, 40),
          child: Column(
            // Full Body Column
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi,",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(49, 83, 67, 0.6),
                        ),
                      ),
                      Text(
                        "welcome back!",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(49, 83, 67, 0.6),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color.fromRGBO(49, 83, 67, 0.2),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Color.fromRGBO(49, 83, 67, 0.8),
                      ),
                    ),
                    onTap: () {
                      Fluttertoast.showToast(msg: "Hello");
                    },
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 54)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: selectOptions("department"),
                  ),
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: selectOptions("semester"),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: selectOptions("subject"),
                  ),
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: selectOptions("year"),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 107)),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ShowOptionsPage(
                          listOfOptions: ["CSE", "ECE", "MECH"],
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    Fluttertoast.showToast(msg: "Fetch question paper");
                  },
                  child: Container(
                    height: 32,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(49, 83, 67, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: const Center(
                      child: Text(
                        "Fetch",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Visit ",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color.fromRGBO(49, 83, 67, 0.6),
                    ),
                  ),
                  Text(
                    "itrepeats.in ",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(49, 83, 67, 0.6),
                    ),
                  ),
                  Text(
                    "to upload question papers.",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color.fromRGBO(49, 83, 67, 0.6),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
