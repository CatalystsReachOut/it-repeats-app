import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:it_repeats/features/presentation/bloc/it_repeats_bloc.dart';
import 'package:it_repeats/features/presentation/widgets/ListData.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDFFile extends StatefulWidget {
  const ViewPDFFile({Key? key}) : super(key: key);

  @override
  State<ViewPDFFile> createState() => _ViewPDFFileState();
}

class _ViewPDFFileState extends State<ViewPDFFile> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  void dispatchItRepeats() {
    BlocProvider.of<ItRepeatsBloc>(context).add(
      GetQuestionPaperEntity(
          selectDepartment, selectSemester, selectSubject, selectYear),
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
              // print("State Here -->" + state.questionPaperEntity.toString());

              return SfPdfViewer.network(
                state.questionPaperEntity.fileURL,
                // 'https://storage.googleapis.com/it-repeats-ea39a.appspot.com/Shreyas_Final.pdf?GoogleAccessId=firebase-adminsdk-hufji%40it-repeats-ea39a.iam.gserviceaccount.com&Expires=16446997800&Signature=kdNGA3nPFwjIHT2OKdhUF%2FGoxBE8Akbxrggo3qSAOwsM3TOjZdWb3A0OX3cr0eDx7IvusWK51LFw3qN2zqGf2lwp26sPtI2%2FLkL%2BtrkFYk%2BdHAhhq59mfyqp7sSBM50P%2FSPygMJ%2FnHW6ylS6Q%2B6TWwRYxapOGkUt8oJE9R%2FrMqVDT2BOj0g2%2B9Y3MdyQI73%2FyhTHJ05dSESECHbOVOjsUMPrz9IkC1Yec06nLX6mQjo3ZxcOgvg3vOqqYe7lF0%2BbMmnpE0%2FQlAp%2BIM6O9coRoEcuFddGe78zZM2V2%2BpiqfeTglJwMY%2BfddMiKYZ0cuogY6IgPMebOzYDn1885Cx5QQ%3D%3D',
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
