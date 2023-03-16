import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_repeats/features/presentation/bloc/it_repeats_bloc.dart';
import 'package:it_repeats/features/presentation/pages/ViewPDF.dart';
// import 'package:it_repeats/features/presentation/pages/ShowOptionsPage.dart';
import 'package:it_repeats/features/presentation/widgets/SelectOptionsWidget.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  void dispatchItRepeats() {
    BlocProvider.of<ItRepeatsBloc>(context).add(GetQuestionPaperEntity(
        selectDepartment, selectSemester, selectSubject, selectYear));
  }

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
                      Fluttertoast.showToast(
                          msg:
                              "See Contributions. Redirects to https://ItRepeats.in");
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
                    child: selectOptions(
                        context,
                        "department",
                        [
                          "Computer Science",
                          "Mechanical Engineering",
                          "Electronics and Communication"
                        ],
                        selectDepartment),
                  ),
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: selectOptions(
                        context,
                        "semester",
                        ["1", "2", "3", "4", "5", "6", "7", "8"],
                        selectSemester),
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
                    child: selectOptions(
                        context,
                        "subject",
                        ["ARM", "Thermodynamics", "Data Structures"],
                        selectSubject),
                  ),
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: selectOptions(context, "year",
                        ["2022", "2021", "2020", "2019", "2018"], selectYear),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 107)),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ViewPDFFile()),
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
