import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';

class ShowOptionsPage extends StatefulWidget {
  final List<String> listOfOptions;
  final String choose;

  const ShowOptionsPage(
      {Key? key, required this.listOfOptions, required this.choose})
      : super(key: key);

  @override
  State<ShowOptionsPage> createState() => _ShowOptionsPageState();
}

class _ShowOptionsPageState extends State<ShowOptionsPage> {
  void assignValueToVariable(String choose, String assign) {
    setState(() {
      if (choose == "department") {
        selectDepartment = assign;
      } else if (choose == "semester") {
        selectSemester = assign;
      } else if (choose == "subject") {
        selectSubject = assign;
      } else if (choose == "year") {
        selectYear == assign;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.listOfOptions.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  assignValueToVariable(
                      widget.choose, widget.listOfOptions[index]);
                  Fluttertoast.showToast(msg: widget.listOfOptions[index]);
                  Navigator.pop(context);
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.listOfOptions[index],
                      textScaleFactor: 1.0,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
