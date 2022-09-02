// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:technical_service_report/screen/home_screen.dart';
import 'package:technical_service_report/style/color.dart';

Future<void> saveAndLaunchFile(
    Function(String path) onLaunch, List<int> bytes, String fileName) async {
  final path = (await getExternalStorageDirectory())!.path;
  log(path);

  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  onLaunch('$path/$fileName');
}
// ignore_for_file: avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, avoid_print

class PDFScreen extends StatefulWidget {
  final String? path;
  final PdfDocument document;
  final List<int> bytes;
  final String? name;
  const PDFScreen(
      {Key? key,
      this.path,
      required this.document,
      required this.bytes,
      this.name})
      : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  Future<void> downloadFile(PdfDocument document, List<int> bytes) async {
    const path = "/storage/emulated/0/Download";
    String fileName = "T.pdf";
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
  }

  Future<void> shareFile(PdfDocument document, List<int> bytes) async {
    final path = (await getExternalStorageDirectory())!.path;

    final file = File('$path/${widget.name}');
    List<String>? files = [file.path];
    await Share.shareFiles(files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueish(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .55,
                    child: PDFView(
                      filePath: widget.path,
                      onRender: (_pages) {
                        setState(() {
                          pages = _pages;
                          isReady = true;
                        });
                      },
                      onError: (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                        print(error.toString());
                      },
                      onPageError: (page, error) {
                        setState(() {
                          errorMessage = '$page: ${error.toString()}';
                        });
                        print('$page: ${error.toString()}');
                      },
                      onViewCreated: (PDFViewController pdfViewController) {
                        _controller.complete(pdfViewController);
                      },
                    ),
                  ),
                  errorMessage.isEmpty
                      ? !isReady
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container()
                      : Center(
                          child: Text(errorMessage),
                        )
                ],
              ),
            ),
            OutlinedButton(
                onPressed: () async {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: blueish(),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  var status = Permission.storage.status;
                                  bool isGranted = await status.isGranted;
                                  if (isGranted) {
                                    downloadFile(widget.document, widget.bytes);
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        backgroundColor: blueish(),
                                        title: Text(
                                            'Pdf Telah di Download sebagai ${widget.name}'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    Permission.storage.request();
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.all(30),
                                    padding: EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: blueish()),
                                    child: Icon(
                                      Icons.download,
                                      size: 50,
                                      color: Colors.white,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  shareFile(widget.document, widget.bytes);
                                },
                                child: Container(
                                    margin: EdgeInsets.all(30),
                                    padding: EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: blueish()),
                                    child: Icon(
                                      Icons.share,
                                      size: 50,
                                      color: Colors.white,
                                    )),
                              ),
                            ]),
                      );
                    },
                  );
                },
                child: Text("Save")),
            OutlinedButton(
                onPressed: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text("Done"))
          ],
        ));
  }
}
