import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_repeats/features/presentation/pages/ViewPDF.dart';
import 'package:it_repeats/features/presentation/widgets/SelectOptionsWidget.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  // void dispatchItRepeats() {
  //   BlocProvider.of<ItRepeatsBloc>(context).add(GetQuestionPaperEntity(
  //     selectDepartment,
  //     selectSemester,
  //     selectSubject,
  //     selectYear,
  //     dropDownSelectedItem!,
  //   ));
  // }

  @override
  void initState() {
    super.initState();
    // changeManager.addListener(() {});
  }

  @override
  void dispose() {
    // changeManager.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<ChangeManager>(
        create: (context) => ChangeManager(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(24, 34, 24, 40),
            child: Consumer<ChangeManager>(
              builder: (context, changeManager, child) {
                return Column(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Color.fromRGBO(49, 83, 67, 0.2),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(49, 83, 67, 0.8),
                            ),
                          ),
                          onTap: () async {
                            final Uri uri =
                                Uri(scheme: 'https', host: 'pub.dev');

                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          onLongPress: () {
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
                              "Electronics and Communication",
                            ],
                            changeManager.selectDepartment,
                            changeManager,
                          ),
                        ),
                        SizedBox(
                          width: 154,
                          height: 154,
                          child: selectOptions(
                              context,
                              "semester",
                              ["1", "2", "3", "4", "5", "6", "7", "8"],
                              changeManager.selectSemester,
                              changeManager),
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
                            [
                              "ARM",
                              "Thermodynamics",
                              "Data Structures",
                              "Operating Systems"
                            ],
                            changeManager.selectSubject,
                            changeManager,
                          ),
                        ),
                        SizedBox(
                          width: 154,
                          height: 154,
                          child: selectOptions(
                            context,
                            "year",
                            ["2022", "2021", "2020", "2019", "2018"],
                            changeManager.selectYear,
                            changeManager,
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 107)),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          changeManager.isReady
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ViewPDFFile(
                                      stateManager: changeManager,
                                    ),
                                  ),
                                )
                              : Fluttertoast.showToast(
                                  msg: "Choose all options first!");
                        },
                        onLongPress: () {
                          Fluttertoast.showToast(
                            msg: "Fetch question paper",
                          );
                        },
                        child: Container(
                          height: 32,
                          width: 100,
                          decoration: BoxDecoration(
                              color: changeManager.manageFetchButtonColour(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: const Center(
                            child: Text(
                              "Fetch",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Visit ',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(49, 83, 67, 0.6),
                              ),
                            ),
                            TextSpan(
                              text: 'itrepeats.in',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(49, 83, 67, 0.6),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final Uri uri =
                                      Uri(scheme: 'https', host: 'pub.dev');

                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(
                                      uri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                            ),
                            const TextSpan(
                                text: ' to upload question papers.',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(49, 83, 67, 0.6),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
