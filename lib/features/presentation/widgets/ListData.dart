import 'package:flutter/material.dart';

String selectDepartment = "Computer Science";
String selectSemester = "4";
String selectSubject = "Operating Systems";
String selectYear = "2022";
String? dropDownSelectedItem = "ISA1";

Color fetchButtonColor = Colors.greenAccent;
// const Color.fromRGBO(49, 83, 67, 0.2);

// ChangeManager changeManager = ChangeManager();

class ChangeManager extends ChangeNotifier {
  String _selectDepartment = "";
  String _selectSemester = "";
  String _selectSubject = "";
  String _selectYear = "";
  bool isReady = false;

  String get selectDepartment => _selectDepartment;
  String get selectSemester => _selectSemester;
  String get selectSubject => _selectSubject;
  String get selectYear => _selectYear;

  set department(String val) {
    _selectDepartment = val;
  }

  set semester(String val) {
    _selectSemester = val;
  }

  set subject(String val) {
    _selectSubject = val;
  }

  set year(String val) {
    _selectYear = val;
  }

  Color manageFetchButtonColour() {
    if (selectDepartment != "" &&
        selectSemester != "" &&
        selectSubject != "" &&
        selectYear != "") {
      isReady = true;
      return Colors.green;
    }
    return const Color.fromRGBO(49, 83, 67, 0.2);
  }

  void updateChanges() {
    notifyListeners();
  }
}
