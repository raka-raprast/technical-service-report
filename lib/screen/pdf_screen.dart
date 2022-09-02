// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:technical_service_report/function/pdf_preview.dart';
import 'package:technical_service_report/models/firstpage.dart';
import 'package:technical_service_report/models/lube.dart';
import 'package:technical_service_report/models/secondpage.dart';

import '../models/analysis.dart';

Future<void> createPDF(
  BuildContext context,
  FirstPage firstPageComponent,
  SecondPage secondPageComponent,
  List<Analysis> listAnalysis,
) async {
  var fp = firstPageComponent;
  var sp = secondPageComponent;
  var an = listAnalysis;
  PdfDocument document = PdfDocument();
  document.pageSettings.size = Size(511, 545);
  document.pageSettings.margins.all = 0;
  final firstPage = document.pages.add();
  if (an.isNotEmpty) {
    final secondPage = document.pages.add();
    secondPage.graphics.drawRectangle(
        brush: PdfBrushes.lightBlue, bounds: Rect.fromLTRB(0, 0, 511, 545));
    secondPage.graphics.drawRectangle(
        pen: PdfPens.darkRed, bounds: Rect.fromLTRB(0, 0, 511, 15));
    secondPage.graphics.drawString(
        "ANALYSIS:(describe detail of failure, analyse the cause, operating condition and attached photographs)",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        bounds: Rect.fromLTRB(10, 5, 0, 0));
    //analysis 1

    if (listAnalysis.isNotEmpty) {
      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.bisque, bounds: Rect.fromLTRB(0, 20, 511, 35));
      secondPage.graphics.drawString(
          "1.${listAnalysis[0].title.toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(10, 25, 0, 0));

      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.black, bounds: Rect.fromLTRB(10, 50, 100, 140));
      secondPage.graphics.drawImage(
          PdfBitmap(listAnalysis[0].image!.readAsBytesSync()),
          Rect.fromLTRB(10, 50, 100, 140));
      List<String> splitDesc1 = listAnalysis[0].description.split(" ");

      secondPage.graphics.drawString(
          "${splitDesc1.sublist(0, splitDesc1.length < 11 ? splitDesc1.length : 11).join(" ").toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(110, 65, 0, 0));
      if (splitDesc1.length > 11) {
        secondPage.graphics.drawString(
            "${splitDesc1.sublist(12, splitDesc1.length < 23 ? splitDesc1.length : 23).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 75, 0, 0));
      }
      if (splitDesc1.length > 23) {
        secondPage.graphics.drawString(
            "${splitDesc1.sublist(24, splitDesc1.length < 35 ? splitDesc1.length : 35).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 85, 0, 0));
      }
      if (splitDesc1.length > 35) {
        secondPage.graphics.drawString(
            "${splitDesc1.sublist(36, splitDesc1.length < 47 ? splitDesc1.length : 47).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 95, 0, 0));
      }
      if (splitDesc1.length > 47) {
        secondPage.graphics.drawString(
            "${splitDesc1.sublist(48, splitDesc1.length < 59 ? splitDesc1.length : 59).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 105, 0, 0));
      }
      if (splitDesc1.length > 59) {
        secondPage.graphics.drawString(
            "${splitDesc1.sublist(60, splitDesc1.length < 71 ? splitDesc1.length : 71).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 115, 0, 0));
      }
    }
    //analysis 2
    if (listAnalysis.length > 1) {
      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.bisque, bounds: Rect.fromLTRB(0, 150, 511, 165));
      secondPage.graphics.drawString(
          "2.${listAnalysis[1].title.toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(10, 155, 0, 0));

      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.black, bounds: Rect.fromLTRB(10, 180, 100, 270));
      secondPage.graphics.drawImage(
          PdfBitmap(listAnalysis[1].image!.readAsBytesSync()),
          Rect.fromLTRB(10, 180, 100, 270));
      List<String> splitDesc2 = listAnalysis[1].description.split(" ");

      secondPage.graphics.drawString(
          "${splitDesc2.sublist(0, splitDesc2.length < 11 ? splitDesc2.length : 11).join(" ").toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(110, 195, 0, 0));
      if (splitDesc2.length > 11) {
        secondPage.graphics.drawString(
            "${splitDesc2.sublist(12, splitDesc2.length < 23 ? splitDesc2.length : 23).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 205, 0, 0));
      }
      if (splitDesc2.length > 23) {
        secondPage.graphics.drawString(
            "${splitDesc2.sublist(24, splitDesc2.length < 35 ? splitDesc2.length : 35).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 215, 0, 0));
      }
      if (splitDesc2.length > 35) {
        secondPage.graphics.drawString(
            "${splitDesc2.sublist(36, splitDesc2.length < 47 ? splitDesc2.length : 47).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 225, 0, 0));
      }
      if (splitDesc2.length > 47) {
        secondPage.graphics.drawString(
            "${splitDesc2.sublist(48, splitDesc2.length < 59 ? splitDesc2.length : 59).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 235, 0, 0));
      }
      if (splitDesc2.length > 59) {
        secondPage.graphics.drawString(
            "${splitDesc2.sublist(60, splitDesc2.length < 71 ? splitDesc2.length : 71).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 245, 0, 0));
      }
    }
    //analysis 3
    if (listAnalysis.length > 2) {
      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.bisque, bounds: Rect.fromLTRB(0, 280, 511, 295));
      secondPage.graphics.drawString(
          "3.${listAnalysis[2].title.toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(10, 285, 0, 0));

      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.black, bounds: Rect.fromLTRB(10, 310, 100, 400));
      secondPage.graphics.drawImage(
          PdfBitmap(listAnalysis[2].image!.readAsBytesSync()),
          Rect.fromLTRB(10, 310, 100, 400));
      List<String> splitDesc3 = listAnalysis[2].description.split(" ");

      secondPage.graphics.drawString(
          "${splitDesc3.sublist(0, splitDesc3.length < 11 ? splitDesc3.length : 11).join(" ").toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(110, 325, 0, 0));
      if (splitDesc3.length > 11) {
        secondPage.graphics.drawString(
            "${splitDesc3.sublist(12, splitDesc3.length < 23 ? splitDesc3.length : 23).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 335, 0, 0));
      }
      if (splitDesc3.length > 23) {
        secondPage.graphics.drawString(
            "${splitDesc3.sublist(24, splitDesc3.length < 35 ? splitDesc3.length : 35).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 345, 0, 0));
      }
      if (splitDesc3.length > 35) {
        secondPage.graphics.drawString(
            "${splitDesc3.sublist(36, splitDesc3.length < 47 ? splitDesc3.length : 47).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 355, 0, 0));
      }
      if (splitDesc3.length > 47) {
        secondPage.graphics.drawString(
            "${splitDesc3.sublist(48, splitDesc3.length < 59 ? splitDesc3.length : 59).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 365, 0, 0));
      }
      if (splitDesc3.length > 59) {
        secondPage.graphics.drawString(
            "${splitDesc3.sublist(60, splitDesc3.length < 71 ? splitDesc3.length : 71).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 375, 0, 0));
      }
    }
    //analysis 4
    if (listAnalysis.length > 3) {
      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.bisque, bounds: Rect.fromLTRB(0, 410, 511, 425));
      secondPage.graphics.drawString(
          "4.${listAnalysis[3].title.toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(10, 415, 0, 0));

      secondPage.graphics.drawRectangle(
          brush: PdfBrushes.black, bounds: Rect.fromLTRB(10, 440, 100, 530));
      secondPage.graphics.drawImage(
          PdfBitmap(listAnalysis[3].image!.readAsBytesSync()),
          Rect.fromLTRB(10, 440, 100, 530));
      List<String> splitDesc4 = listAnalysis[4].description.split(" ");

      secondPage.graphics.drawString(
          "${splitDesc4.sublist(0, splitDesc4.length < 11 ? splitDesc4.length : 11).join(" ").toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          bounds: Rect.fromLTRB(110, 455, 0, 0));
      if (splitDesc4.length > 11) {
        secondPage.graphics.drawString(
            "${splitDesc4.sublist(12, splitDesc4.length < 23 ? splitDesc4.length : 23).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 465, 0, 0));
      }
      if (splitDesc4.length > 23) {
        secondPage.graphics.drawString(
            "${splitDesc4.sublist(24, splitDesc4.length < 35 ? splitDesc4.length : 35).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 475, 0, 0));
      }
      if (splitDesc4.length > 35) {
        secondPage.graphics.drawString(
            "${splitDesc4.sublist(36, splitDesc4.length < 47 ? splitDesc4.length : 47).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 485, 0, 0));
      }
      if (splitDesc4.length > 47) {
        secondPage.graphics.drawString(
            "${splitDesc4.sublist(48, splitDesc4.length < 59 ? splitDesc4.length : 59).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 495, 0, 0));
      }
      if (splitDesc4.length > 59) {
        secondPage.graphics.drawString(
            "${splitDesc4.sublist(60, splitDesc4.length < 71 ? splitDesc4.length : 71).join(" ").toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            bounds: Rect.fromLTRB(110, 505, 0, 0));
      }
    }
  }
  final thirdPage = document.pages.add();
  bool attachedPhoto = an.isNotEmpty;
  firstPage.graphics.drawString("TSR",
      PdfStandardFont(PdfFontFamily.timesRoman, 45, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 0, 0, 0));
  firstPage.graphics.drawString("TECHNICAL SERVICE REPORT",
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 47.5, 0, 0));
  firstPage.graphics.drawString("CV. ATH SEJAHTERA",
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(400, 45, 0, 0));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 60, 511, 400));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(180, 45), Offset(205, 45));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed, bounds: Rect.fromLTRB(180, 30, 205, 60));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 60, 511, 115));
  double firstHorizRectStart = 100;
  for (var i = 0; i < 11; i++) {
    firstHorizRectStart = firstHorizRectStart + 15;
    firstPage.graphics.drawRectangle(
        pen: PdfPens.darkRed,
        brush: PdfBrushes.lightBlue,
        bounds: Rect.fromLTRB(
            0, firstHorizRectStart, 511, firstHorizRectStart + 15));
  }
  double secondHorizRectStart = 225;
  for (var i = 0; i < 3; i++) {
    secondHorizRectStart = secondHorizRectStart + 55;
    if (i != 0) {
      firstPage.graphics.drawRectangle(
          pen: PdfPens.darkRed,
          brush: PdfBrushes.lightBlue,
          bounds: Rect.fromLTRB(
              0, secondHorizRectStart, 511, secondHorizRectStart + 15));
    }
    firstPage.graphics.drawRectangle(
        pen: PdfPens.darkRed,
        brush: PdfBrushes.lightBlue,
        bounds: Rect.fromLTRB(
            0, secondHorizRectStart + 15, 511, secondHorizRectStart + 55));
  }
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 445, 511, 460));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 460, 511, 475));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 475, 511, 530));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(25, 487.5, 50, 505));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(25, 505, 50, 522.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(100, 487.5, 125, 505));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(100, 505, 125, 522.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(175, 487.5, 200, 505));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(175, 505, 200, 522.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(250, 487.5, 275, 505));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(250, 505, 275, 522.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(325, 487.5, 350, 505));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(400, 505, 425, 522.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(400, 487.5, 425, 505));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(325, 505, 350, 522.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 530, 511, 545));
  firstPage.graphics.drawLine(PdfPens.darkRed, Offset(0, 75), Offset(205, 75));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(120, 60), Offset(120, 115));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(205, 60), Offset(205, 175));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(320, 60), Offset(320, 115));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(415.5, 60), Offset(415.5, 115));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(350, 115), Offset(350, 145));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(350, 175), Offset(350, 235));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(430, 145), Offset(430, 235));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(285, 175), Offset(285, 205));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(135, 175), Offset(135, 235));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(125, 235), Offset(125, 265));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(205, 235), Offset(205, 265));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(315, 235), Offset(315, 265));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(415.5, 235), Offset(415.5, 445));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(125, 280), Offset(125, 390));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(270, 265), Offset(270, 390));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(340.67, 445), Offset(340.67, 475));
  firstPage.graphics
      .drawLine(PdfPens.darkRed, Offset(170.35, 445), Offset(170.35, 475));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(285, 190, 350, 235));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black,
      brush: PdfBrushes.lightGray,
      bounds: Rect.fromLTRB(425, 65, 445, 80));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black,
      brush: PdfBrushes.lightGray,
      bounds: Rect.fromLTRB(425, 80, 445, 95));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black,
      brush: PdfBrushes.lightGray,
      bounds: Rect.fromLTRB(425, 95, 445, 110));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(290, 195, 305, 210));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(290, 215, 305, 230));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(415.5, 390, 463.25, 420));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(463.25, 390, 511, 420));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(463.25, 420, 511, 445));
  //claimable
  firstPage.graphics.drawString("CLAIMABLE",
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      brush: PdfBrushes.black, bounds: Rect.fromLTRB(210, 32.5, 0, 0));
  firstPage.graphics.drawString(
      "V",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(190, 30, 0, 0));
  firstPage.graphics.drawString("INFORMATION ONLY",
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      brush: PdfBrushes.black, bounds: Rect.fromLTRB(210, 47.5, 0, 0));
  if (fp.claimability!.contains("Claimable")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(190, 45, 0, 0));
  }
  //report no.
  firstPage.graphics.drawString(
      "REPORT NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 62.5, 0, 0));
  firstPage.graphics.drawString(
      fp.reportNumber!,
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 80, 0, 0));
  //date month year
  firstPage.graphics.drawString(
      "DATE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(125, 62.5, 0, 0));
  if (fp.date!.isNotEmpty && fp.month!.isNotEmpty && fp.year!.isNotEmpty) {
    firstPage.graphics.drawString(
        "${fp.date}-${fp.month}-${fp.year}",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(135, 80, 0, 0));
  }
  //concept claim no
  firstPage.graphics.drawString(
      "CONCEPT CLAIM NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(210, 62.5, 0, 0));
  firstPage.graphics.drawString(
      fp.conceptClaimNo!,
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(210, 80, 0, 0));
  //claim date month year
  firstPage.graphics.drawString(
      "DATE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(330, 62.5, 0, 0));
  if (fp.claimDate!.isNotEmpty &&
      fp.claimMonth!.isNotEmpty &&
      fp.claimYear!.isNotEmpty) {
    firstPage.graphics.drawString(
        "${fp.claimDate}-${fp.claimMonth}-${fp.claimYear}",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(340, 80, 0, 0));
  }

  //parts true false
  firstPage.graphics.drawString(
      "Parts",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(450, 65, 0, 0));
  if (fp.partDetail!.contains("Part")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(432.5, 67.5, 0, 0));
  }

  //technical true false

  firstPage.graphics.drawString(
      "Technical",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(450, 80, 0, 0));
  if (fp.partDetail!.contains("Technical")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(432.5, 80, 0, 0));
  }
  //modification true false
  firstPage.graphics.drawString(
      "Modification",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(450, 95, 0, 0));
  if (fp.partDetail!.contains("Modification")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(432.5, 97.5, 0, 0));
  }

  // branch
  firstPage.graphics.drawString(
      "BRANCH",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 117.5, 0, 0));
  firstPage.graphics.drawString(
      fp.branch!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 132.5, 0, 0));
  // machine make
  firstPage.graphics.drawString(
      "MACHINE MAKE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(210, 117.5, 0, 0));
  firstPage.graphics.drawString(
      fp.machineMake!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(210, 132.5, 0, 0));
  // customer business
  firstPage.graphics.drawString(
      "CUSTOMER BUSINESS",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(360, 117.5, 0, 0));
  firstPage.graphics.drawString(
      fp.customerBusiness!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(360, 132.5, 0, 0));
  //customer name
  firstPage.graphics.drawString(
      "CUSTOMER NAME",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 147.5, 0, 0));
  firstPage.graphics.drawString(
      fp.customerName!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 162.5, 0, 0));
  // machine location
  firstPage.graphics.drawString(
      "MACHINE LOCATION",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(210, 147.5, 0, 0));
  firstPage.graphics.drawString(
      fp.machineLocation!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(210, 162.5, 0, 0));
  // mileage
  firstPage.graphics.drawString(
      "MILEAGE(PP)",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(435, 147.5, 0, 0));
  firstPage.graphics.drawString(
      fp.mileage.toString(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(435, 162.5, 0, 0));
  firstPage.graphics.drawString(
      "Km",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(485, 162.5, 0, 0));
  //machine model
  firstPage.graphics.drawString(
      "MACHINE MODEL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 177.5, 0, 0));
  firstPage.graphics.drawString(
      fp.machineModel!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 192.5, 0, 0));
  //machine serial number
  firstPage.graphics.drawString(
      "MACHINE SERIAL NUMBER",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(140, 177.5, 0, 0));
  firstPage.graphics.drawString(
      fp.serialNo!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(140, 192.5, 0, 0));
  //standard true false
  firstPage.graphics.drawString(
      "ATTACHMENT",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(290, 177.5, 0, 0));
  firstPage.graphics.drawString(
      "Standard",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(310, 197.5, 0, 0));
  if (fp.attachment == "Standard") {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(295, 197.5, 0, 0));
  }
  //optional true false
  firstPage.graphics.drawString(
      "Optional",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(310, 217.5, 0, 0));
  if (fp.attachment == "Optional") {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(295, 217.5, 0, 0));
  }
  //name
  firstPage.graphics.drawString(
      "NAME",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(355, 177.5, 0, 0));
  firstPage.graphics.drawString(
      fp.name!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(355, 192.5, 0, 0));
  //make
  firstPage.graphics.drawString(
      "DOOSAN",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(435, 177.5, 0, 0));
  firstPage.graphics.drawString(
      fp.make!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(435, 192.5, 0, 0));
  //engine model
  firstPage.graphics.drawString(
      "ENGINE MODEL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 207.5, 0, 0));
  firstPage.graphics.drawString(
      fp.engineModel!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 222.5, 0, 0));
  //smr/hrs
  firstPage.graphics.drawString(
      "SMR/HRS",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 237.5, 0, 0));
  firstPage.graphics.drawString(
      fp.smrHrs!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 252.5, 0, 0));
  // smr/km

  firstPage.graphics.drawString(
      "SMR/KM",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(130, 237.5, 0, 0));
  firstPage.graphics.drawString(
      fp.smrKm!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(130, 252.5, 0, 0));
  // delivery date
  firstPage.graphics.drawString(
      "DELIVERY DATE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(210, 237.5, 0, 0));
  firstPage.graphics.drawString(
      fp.deliveryDate!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(210, 252.5, 0, 0));
  // trouble date
  firstPage.graphics.drawString(
      "TROUBLE DATE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(320, 237.5, 0, 0));
  firstPage.graphics.drawString(
      fp.troubleDate!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(320, 252.5, 0, 0));
  //engine no
  firstPage.graphics.drawString(
      "ENGINE NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(140, 207.5, 0, 0));
  firstPage.graphics.drawString(
      fp.engineNumber!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(140, 222.5, 0, 0));
  //model
  firstPage.graphics.drawString(
      "MODEL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(355, 207.5, 0, 0));
  firstPage.graphics.drawString(
      fp.model!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(355, 222.5, 0, 0));
  //payload
  firstPage.graphics.drawString(
      "* PAYLOAD",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 282.5, 0, 0));
  firstPage.graphics.drawString(
      fp.payload!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 310, 0, 0));
  //burn true false
  firstPage.graphics.drawString(
      "Burn",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(55, 490, 0, 0));
  if (fp.failure!.contains("Burn")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(35, 490, 0, 0));
  }
  //bend true false
  firstPage.graphics.drawString(
      "Bend",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(55, 510, 0, 0));
  if (fp.failure!.contains("Bend")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(35, 510, 0, 0));
  }

  //broken true false
  firstPage.graphics.drawString(
      "Broken",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(130, 490, 0, 0));
  if (fp.failure!.contains("Broken")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(110, 490, 0, 0));
  }
  //crack true false
  firstPage.graphics.drawString(
      "Crack",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(130, 510, 0, 0));
  if (fp.failure!.contains("Crack")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(110, 510, 0, 0));
  }
  //dent true false
  firstPage.graphics.drawString(
      "Dent",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(205, 490, 0, 0));
  if (fp.failure!.contains("Dent")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(185, 490, 0, 0));
  }

  //loose true false
  firstPage.graphics.drawString(
      "Loose",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(205, 510, 0, 0));
  if (fp.failure!.contains("Loose")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(185, 510, 0, 0));
  }

  //scratch true false
  firstPage.graphics.drawString(
      "Scratch",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(280, 490, 0, 0));
  if (fp.failure!.contains("Scratch")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(260, 490, 0, 0));
  }

  //short true false
  firstPage.graphics.drawString(
      "Short",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(280, 510, 0, 0));
  if (fp.failure!.contains("Short")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(260, 510, 0, 0));
  }
  //pitting true false
  firstPage.graphics.drawString(
      "Pitting",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(355, 490, 0, 0));
  if (fp.failure!.contains("Pitting")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(335, 490, 0, 0));
  }
  //rusty true false
  firstPage.graphics.drawString(
      "Rusty",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(355, 510, 0, 0));
  if (fp.failure!.contains("Rusty")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(335, 510, 0, 0));
  }
  //worn true false
  firstPage.graphics.drawString(
      "Worn",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(430, 490, 0, 0));
  if (fp.failure!.contains("Worn")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(410, 490, 0, 0));
  }
  //others true false
  firstPage.graphics.drawString(
      "Others",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(430, 510, 0, 0));
  if (fp.failure!.contains("Other")) {
    firstPage.graphics.drawString(
        "V",
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(410, 510, 0, 0));
  }

  //application
  firstPage.graphics.drawString(
      "APPLICATION",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 337.5, 0, 0));
  firstPage.graphics.drawString(
      fp.application!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 365, 0, 0));
  //working condition
  firstPage.graphics.drawString(
      "WORKING CONDITION",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(130, 337.5, 0, 0));
  firstPage.graphics.drawString(
      fp.workingCondition!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(130, 365, 0, 0));
  //ground condition
  firstPage.graphics.drawString(
      "GROUND CONDITION",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(275, 337.5, 0, 0));
  firstPage.graphics.drawString(
      fp.groundCondition!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(275, 365, 0, 0));
  //environtment
  firstPage.graphics.drawString(
      "ENVIRONTMENT",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 337.5, 0, 0));
  firstPage.graphics.drawString(
      fp.environment!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(420, 365, 0, 0));
  //causing part
  firstPage.graphics.drawString(
      "CAUSING PART",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 447.5, 0, 0));
  firstPage.graphics.drawString(
      fp.causingPart!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(7, 462.5, 0, 0));
  //description
  firstPage.graphics.drawString(
      "DESCRIPTION",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(180, 447.5, 0, 0));
  firstPage.graphics.drawString(
      fp.description!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(180, 462.5, 0, 0));
  //component
  firstPage.graphics.drawString(
      "COMPONENT",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(350, 447.5, 0, 0));
  firstPage.graphics.drawString(
      fp.component!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(350, 462.5, 0, 0));
  //total machine owned
  firstPage.graphics.drawString(
      "TOTAL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 390, 0, 0));
  firstPage.graphics.drawString(
      "MACHINE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 400, 0, 0));
  firstPage.graphics.drawString(
      "OWNED",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 410, 0, 0));
  firstPage.graphics.drawString(
      fp.totalMachineOwned!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(480, 400, 0, 0));
  //the same problem
  firstPage.graphics.drawString(
      "THE SAME",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 420, 0, 0));
  firstPage.graphics.drawString(
      "PROBLEM",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 430, 0, 0));
  firstPage.graphics.drawString(
      fp.theSameProblem!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(480, 427.5, 0, 0));
  //material carriage
  firstPage.graphics.drawString(
      "*MATERIAL CARRIAGE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(130, 282.5, 0, 0));
  firstPage.graphics.drawString(
      fp.mateialCarriage!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(130, 310, 0, 0));
  //max speed
  firstPage.graphics.drawString(
      "*MAX SPEED",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(275, 282.5, 0, 0));
  firstPage.graphics.drawString(
      fp.maxSpeed!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(275, 310, 0, 0));
  //avg speed
  firstPage.graphics.drawString(
      "*AVERAGE SPEED",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(420, 282.5, 0, 0));
  firstPage.graphics.drawString(
      fp.averageSpeed!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(420, 310, 0, 0));

  //serial no
  firstPage.graphics.drawString(
      "SERIAL NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(435, 207.5, 0, 0));
  firstPage.graphics.drawString(
      fp.serialNo!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(435, 222.5, 0, 0));
  // complaint
  firstPage.graphics.drawString(
      "COMPLAINT",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTRB(7, 395, 0, 0));
  firstPage.graphics.drawString(fp.complaint!.toUpperCase(),
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold),
      brush: PdfBrushes.red, bounds: Rect.fromLTRB(7, 417.5, 0, 0));

  // third page
  thirdPage.graphics.drawRectangle(
      brush: PdfBrushes.lightBlue, bounds: Rect.fromLTRB(0, 0, 511, 545));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(110, 25, 140, 90));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(260, 25, 290, 90));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(420, 25, 450, 90));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 130, 511, 145));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed,
      brush: PdfBrushes.lightBlue,
      bounds: Rect.fromLTRB(0, 145, 511, 185));

  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(125, 25), Offset(125, 90));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(275, 25), Offset(275, 90));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(435, 25), Offset(435, 90));
  // thirdPage.graphics.drawRectangle(
  //     pen: PdfPens.darkRed,
  //     brush: PdfBrushes.lightBlue,
  //     bounds: Rect.fromLTRB(0, 5, 511, 15));

  double spFirstHorizStart = 25;
  for (var i = 0; i < 3; i++) {
    spFirstHorizStart = spFirstHorizStart + 16.25;
    thirdPage.graphics.drawLine(PdfPens.darkRed, Offset(110, spFirstHorizStart),
        Offset(140, spFirstHorizStart));
    thirdPage.graphics.drawLine(PdfPens.darkRed, Offset(260, spFirstHorizStart),
        Offset(290, spFirstHorizStart));
    thirdPage.graphics.drawLine(PdfPens.darkRed, Offset(420, spFirstHorizStart),
        Offset(450, spFirstHorizStart));
  }
  double spSecondHorizStart = 170;
  for (var i = 0; i < 3; i++) {
    spSecondHorizStart = spSecondHorizStart + 15;
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.darkRed,
        brush: PdfBrushes.lightBlue,
        bounds:
            Rect.fromLTRB(0, spSecondHorizStart, 511, spSecondHorizStart + 15));
  }
  double spThirdHorizStart = 255;
  for (var i = 0; i < 5; i++) {
    spThirdHorizStart = spThirdHorizStart + 15;
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.darkRed,
        brush: PdfBrushes.lightBlue,
        bounds:
            Rect.fromLTRB(0, spThirdHorizStart, 511, spThirdHorizStart + 15));
  }
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed, bounds: Rect.fromLTRB(63.2, 242.5, 88.2, 257.5));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed, bounds: Rect.fromLTRB(310, 360, 330, 375));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed, bounds: Rect.fromLTRB(355, 360, 375, 375));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed, bounds: Rect.fromLTRB(183.2, 242.5, 208.2, 257.5));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(0, 450), Offset(511, 450));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(0, 451), Offset(511, 451));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(430, 130), Offset(430, 185));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(100, 185), Offset(100, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(115, 185), Offset(115, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(130, 185), Offset(130, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(230, 185), Offset(230, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(245, 185), Offset(245, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(260, 185), Offset(260, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(360, 185), Offset(360, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(390, 185), Offset(390, 230));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(60, 270), Offset(60, 345));
  double spFirstVertStart = 63.2;
  for (var i = 0; i < 9; i++) {
    spFirstVertStart = spFirstVertStart + 56.78;
    thirdPage.graphics.drawLine(PdfPens.darkRed, Offset(spFirstVertStart, 270),
        Offset(spFirstVertStart, 345));
  }
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(160, 345), Offset(160, 450));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(0, 380), Offset(160, 380));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(233.56, 345), Offset(233.56, 450));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(403.9, 345), Offset(402.9, 450));

  thirdPage.graphics.drawString(
      "CAUSED:",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 5, 0, 0));
  thirdPage.graphics.drawString(
      "OTHERS:",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 90, 0, 0));
  thirdPage.graphics.drawString(
      "REMEDY",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 132.5, 0, 0));
  thirdPage.graphics.drawString(
      "MANHOURS",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(435, 132.5, 0, 0));
  thirdPage.graphics.drawString(
      "P/N REMOVE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(25, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "G",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(105, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "NG",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(117.5, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "P/N INSTALLED",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(150, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "G",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(235, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "NG",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(247.5, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "PART NAME",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(290, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "QTY",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(367.5, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "WHY IS IT REPLACED",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(410, 187.5, 0, 0));
  thirdPage.graphics.drawString(
      "MISOPERATION",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 30, 0, 0));
  thirdPage.graphics.drawString(
      "MISTMAINTENANCE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 45, 0, 0));
  thirdPage.graphics.drawString(
      "MISADJUSMENT",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 60, 0, 0));
  thirdPage.graphics.drawString(
      "POOR TORQUE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 75, 0, 0));

  thirdPage.graphics.drawString(
      "BAD WELD",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(170, 30, 0, 0));
  thirdPage.graphics.drawString(
      "POOR WELD",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(170, 45, 0, 0));
  thirdPage.graphics.drawString(
      "BAD MATERIAL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(170, 60, 0, 0));
  thirdPage.graphics.drawString(
      "DIRTY FUEL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(170, 75, 0, 0));

  thirdPage.graphics.drawString(
      "MISASSEMBLY",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(320, 30, 0, 0));
  thirdPage.graphics.drawString(
      "FOREIGN MATERIAL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(320, 45, 0, 0));
  thirdPage.graphics.drawString(
      "POOR DURABILITY",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(320, 60, 0, 0));
  thirdPage.graphics.drawString(
      "FATIQUE MATERIAL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(320, 75, 0, 0));
  thirdPage.graphics.drawString(
      "YES",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(110, 15, 0, 0));
  thirdPage.graphics.drawString(
      "NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(127.5, 15, 0, 0));
  //misoperation
  sp.misoperation
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(115, 30, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(130, 30, 0, 0));
  //mismaintenance
  sp.mismaintenance
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(115, 45, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(130, 45, 0, 0));
  //misadjustment
  sp.misadjusment
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(115, 60, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(130, 60, 0, 0));
  //poor torque
  sp.poorTorque
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(115, 75, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(130, 75, 0, 0));
  thirdPage.graphics.drawString(
      "YES",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(260, 15, 0, 0));
  thirdPage.graphics.drawString(
      "NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(277.5, 15, 0, 0));
  //bad weld
  sp.badWeld
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(265, 30, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(280, 30, 0, 0));
  //poor weld
  sp.poorWeld
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(265, 45, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(280, 45, 0, 0));
  //bad material
  sp.badMaterial
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(265, 60, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(280, 60, 0, 0));
  //dirty fuel
  sp.dirtyFuel
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(265, 75, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(280, 75, 0, 0));
  thirdPage.graphics.drawString(
      "YES",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(420, 15, 0, 0));
  thirdPage.graphics.drawString(
      "NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(437.5, 15, 0, 0));
  //misassembly
  sp.misassembly
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(425, 30, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(440, 30, 0, 0));
  //foreign material
  sp.foreignMaterial
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(425, 45, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(440, 45, 0, 0));
  //poor durability
  sp.poorDurability
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(425, 60, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(440, 60, 0, 0));
  //fatique material
  sp.fatiqueMaterial
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(425, 75, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTRB(440, 75, 0, 0));
  //finish status true false
  thirdPage.graphics.drawString(
      "FINISH",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(90, 245, 0, 0));
  sp.status
      ? thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(70, 245, 0, 0))
      : thirdPage.graphics.drawString(
          "${"v".toUpperCase()}",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(190, 245, 0, 0));
  thirdPage.graphics.drawString(
      "NOT FINISH DUE TO:",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(210, 245, 0, 0));
  //pn detail
  if (sp.parts!.isNotEmpty) {
    thirdPage.graphics.drawString(
        sp.parts![0].pnRemove.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(7, 202.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![0].qty.toString(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(370, 202.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![0].pnInstalled.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(135, 202.5, 0, 0));
    sp.parts![0].removeGenuinity
        ? thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(120, 202.5, 0, 0))
        : thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(105, 202.5, 0, 0));

    sp.parts![0].installedGenuinity
        ? thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(235, 202.5, 0, 0))
        : thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(250, 202.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![0].partName.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(265, 202.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![0].repairAction.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(395, 202.5, 0, 0));
  }
  if (sp.parts!.length > 1) {
    thirdPage.graphics.drawString(
        sp.parts![1].pnRemove.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(7, 217.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![1].qty.toString(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(370, 217.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![1].pnInstalled,
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(135, 217.5, 0, 0));
    sp.parts![1].removeGenuinity
        ? thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(120, 217.5, 0, 0))
        : thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(105, 217.5, 0, 0));

    sp.parts![1].installedGenuinity
        ? thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(235, 217.5, 0, 0))
        : thirdPage.graphics.drawString(
            "${"v".toUpperCase()}",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              7,
            ),
            brush: PdfBrushes.red,
            bounds: Rect.fromLTRB(250, 217.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![1].partName.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(265, 217.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.parts![1].repairAction.toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(395, 217.5, 0, 0));
  }

  thirdPage.graphics.drawString(
      "LUBE USED",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 272.5, 0, 0));
  thirdPage.graphics.drawString(
      "MAKE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 287.5, 0, 0));
  thirdPage.graphics.drawString(
      "TYPE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        8,
      ),
      bounds: Rect.fromLTRB(5, 302.5, 0, 0));
  thirdPage.graphics.drawString(
      "SAE NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        8,
      ),
      bounds: Rect.fromLTRB(5, 317.5, 0, 0));
  thirdPage.graphics.drawString(
      "CLASS",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        8,
      ),
      bounds: Rect.fromLTRB(5, 332.5, 0, 0));
  thirdPage.graphics.drawString(
      "SERVICEMAN NAME & SIGN",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 385, 0, 0));
  thirdPage.graphics.drawString(
      fp.mechanicInCharge!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 440, 0, 0));
  thirdPage.graphics.drawRectangle(
      pen: PdfPens.darkRed, bounds: Rect.fromLTRB(5, 460, 25, 475));
  thirdPage.graphics.drawString("Diisi oleh SDH",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(30, 462.5, 0, 0));
  thirdPage.graphics.drawString(
      "(1) G=Genuine  NG=Non Genuine",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(130, 462.5, 0, 0));
  thirdPage.graphics.drawString(
      "(2) *Forklift and Truck",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(280, 462.5, 0, 0));
  thirdPage.graphics.drawString(
      "MECHANIC'S ID:",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(5, 365, 0, 0));
  thirdPage.graphics.drawString(
      fp.mechanicId!.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(60, 365, 0, 0));
  thirdPage.graphics.drawString(
      "MECHANIC",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(180, 365, 0, 0));
  thirdPage.graphics.drawString(
      "ATTACHED PHOTO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(240, 365, 0, 0));
  thirdPage.graphics.drawString(
      "DOCUMENTS",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(435, 365, 0, 0));
  //attached photo true false
  thirdPage.graphics.drawString(
      "YES",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(335, 365, 0, 0));

  thirdPage.graphics.drawString(
      "NO",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(380, 365, 0, 0));
  attachedPhoto
      ? thirdPage.graphics.drawString(
          "V",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(320, 365, 0, 0))
      : thirdPage.graphics.drawString(
          "V",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            7,
          ),
          brush: PdfBrushes.red,
          bounds: Rect.fromLTRB(365, 365, 0, 0));
  thirdPage.graphics.drawString(
      "SDH/SPV NAME & SIGN",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(235, 380, 0, 0));
  //engine oil
  thirdPage.graphics.drawString(
      "ENGINE OIL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(65, 272.5, 0, 0));
  //swing reduction
  thirdPage.graphics.drawString(
      "SWING R",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(125, 272.5, 0, 0));
  //gear oil
  thirdPage.graphics.drawString(
      "GEAR OIL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(180, 272.5, 0, 0));
  //final drive
  thirdPage.graphics.drawString(
      "FINAL DRIVE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(240, 272.5, 0, 0));
//hydraulic oil
  thirdPage.graphics.drawString(
      "HYDRAULIC",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(295, 272.5, 0, 0));
  //steering
  thirdPage.graphics.drawString(
      "STEERING",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(350, 272.5, 0, 0));
  //grease
  thirdPage.graphics.drawString(
      "GREASE",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(410, 272.5, 0, 0));
//brake oil
  thirdPage.graphics.drawString(
      "BRAKE OIL",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(465, 272.5, 0, 0));

  if (sp.lubes!.isNotEmpty) {
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.engineOil)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(65, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.engineOil)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(65, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.engineOil)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(65, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.engineOil)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(65, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.swingReduction)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(125, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.swingReduction)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(125, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.swingReduction)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(125, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.swingReduction)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(125, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.gearOil)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(180, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.gearOil)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(180, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.gearOil)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(180, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.gearOil)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(180, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.finalDrive)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(240, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.finalDrive)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(240, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.finalDrive)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(240, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.finalDrive)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(240, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.hydraulicOil)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(295, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.hydraulicOil)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(295, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.hydraulicOil)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(295, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.hydraulicOil)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(295, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.steering)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(350, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.steering)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(350, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.steering)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(350, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.steering)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(350, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.grease)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(410, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.grease)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(410, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.grease)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(410, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.grease)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(410, 332.5, 0, 0));

    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.brakeOil)
            .first
            .make
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(465, 287.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.brakeOil)
            .first
            .type
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(465, 302.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.brakeOil)
            .first
            .sae
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(465, 317.5, 0, 0));
    thirdPage.graphics.drawString(
        sp.lubes!
            .where((element) => element.lubeUsed == LubeUsed.brakeOil)
            .first
            .cl
            .toUpperCase(),
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTRB(465, 332.5, 0, 0));
  }
  //remedy
  thirdPage.graphics.drawString(sp.remedy.toUpperCase(),
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      brush: PdfBrushes.red, bounds: Rect.fromLTRB(7, 160, 0, 0));
  //manhours
  thirdPage.graphics.drawString(
      sp.manhours.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(440, 160, 0, 0));
  //Inc no
  thirdPage.graphics.drawString(
      "Inc No",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(405, 380, 0, 0));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(435, 390), Offset(511, 390));
  thirdPage.graphics.drawString(
      sp.incNo.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(435, 380, 0, 0));
  //SRO No
  thirdPage.graphics.drawString(
      "SRO No",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(405, 400, 0, 0));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(435, 410), Offset(511, 410));
  thirdPage.graphics.drawString(
      sp.sroNo.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(435, 400, 0, 0));
  //TO No
  thirdPage.graphics.drawString(
      "TO No",
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      bounds: Rect.fromLTRB(405, 420, 0, 0));
  thirdPage.graphics
      .drawLine(PdfPens.darkRed, Offset(435, 430), Offset(511, 430));
  thirdPage.graphics.drawString(
      sp.toNo.toUpperCase(),
      PdfStandardFont(
        PdfFontFamily.helvetica,
        7,
      ),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTRB(435, 420, 0, 0));

  List<int> bytes = await document.save();

  document.dispose();
  DateTime time = DateTime.now();
  String fileName =
      "TSR_${time.day}${time.month}${time.year}${time.hour}${time.minute}.pdf";
  saveAndLaunchFile((path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(
          path: path,
          name: fileName,
          document: document,
          bytes: bytes,
        ),
      ),
    );
  }, bytes, fileName);
}
