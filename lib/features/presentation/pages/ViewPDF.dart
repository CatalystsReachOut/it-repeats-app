import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:it_repeats/features/presentation/bloc/it_repeats_bloc.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDFFile extends StatefulWidget {
  const ViewPDFFile({Key? key, required this.stateManager}) : super(key: key);

  final ChangeManager stateManager;

  @override
  State<ViewPDFFile> createState() => _ViewPDFFileState();
}

class _ViewPDFFileState extends State<ViewPDFFile> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  void dispatchItRepeats() {
    BlocProvider.of<ItRepeatsBloc>(context).add(
      // TODO: Change dispatch parameters!

      GetQuestionPaperEntity(
          widget.stateManager.selectDepartment,
          widget.stateManager.selectSemester,
          widget.stateManager.selectSubject,
          widget.stateManager.selectYear,
          dropDownSelectedItem!),
    );
  }

  @override
  void initState() {
    dispatchItRepeats();

    _pdfViewerController = PdfViewerController();
    // FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    super.initState();
  }

  @override
  void dispose() {
    // FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: Color.fromRGBO(49, 83, 67, 0.6)),
          backgroundColor: Colors.white,
          actions: [
            DropdownButton<String>(
              focusColor: Colors.grey,
              value: dropDownSelectedItem, // Item on Display
              items: ["ISA1", "ISA2", "ESA"].map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  dropDownSelectedItem = value;
                  dispatchItRepeats();
                });
              },
            ),
            IconButton(
              onPressed: () {
                _pdfViewerKey.currentState!.openBookmarkView();
              },
              icon: const Icon(
                Icons.bookmarks,
                color: Color.fromRGBO(49, 83, 67, 0.6),
              ),
            )
          ],
        ),
        body: BlocBuilder<ItRepeatsBloc, ItRepeatsState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Loaded) {
              return SfPdfViewer.network(
                state.questionPaperEntity.fileURL,
                controller: _pdfViewerController,
                key: _pdfViewerKey,
              );
            } else if (state is Error) {
              return Center(
                child: Text(
                  state.message,
                  textScaleFactor: 1.0,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(49, 83, 67, 0.6),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Some Unknown Error Occurred!",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(49, 83, 67, 0.6),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
