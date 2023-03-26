import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_repeats/features/presentation/bloc/it_repeats_bloc.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_repeats/features/presentation/pages/SelectionPage.dart';

void main() async {
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ItRepeatsBloc>(
          create: (context) => di.sl<ItRepeatsBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); // Portrait Mode Orientation ONLY

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
