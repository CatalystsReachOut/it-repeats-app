import 'package:flutter/material.dart';

class ShowOptionsPage extends StatefulWidget {
  final List<String> listOfOptions;

  const ShowOptionsPage({Key? key, required this.listOfOptions})
      : super(key: key);

  @override
  State<ShowOptionsPage> createState() => _ShowOptionsPageState();
}

class _ShowOptionsPageState extends State<ShowOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ListView.builder(
            itemCount: widget.listOfOptions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  widget.listOfOptions[index],
                  textScaleFactor: 1.0,
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
