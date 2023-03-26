import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';

class ShowOptionsPage extends StatefulWidget {
  final List<String> listOfOptions;
  final String choose;
  final ChangeManager changeManager;

  const ShowOptionsPage(
      {Key? key,
      required this.listOfOptions,
      required this.choose,
      required this.changeManager})
      : super(key: key);

  @override
  State<ShowOptionsPage> createState() => _ShowOptionsPageState();
}

class _ShowOptionsPageState extends State<ShowOptionsPage> {
  void assignValueToVariable(String choose, String assign) {
    setState(() {
      if (choose == "department") {
        widget.changeManager.department = assign;
      } else if (choose == "semester") {
        widget.changeManager.semester = assign;
      } else if (choose == "subject") {
        widget.changeManager.subject = assign;
      } else if (choose == "year") {
        widget.changeManager.year = assign;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  widget.changeManager.updateChanges();
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
