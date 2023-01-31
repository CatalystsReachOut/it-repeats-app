import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_repeats/features/presentation/pages/SelectionPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: "It Repeats",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Proxima'),
        home: const SelectionPage(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
