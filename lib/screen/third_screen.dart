// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_service_report/models/analysis.dart';
import 'package:technical_service_report/models/firstpage.dart';
import 'package:technical_service_report/models/secondpage.dart';
import 'package:technical_service_report/screen/add_analysis_screen.dart';
import 'package:technical_service_report/screen/payment_screen.dart';
import 'package:technical_service_report/screen/pdf_screen.dart';
import 'package:technical_service_report/style/color.dart';
import 'package:technical_service_report/style/size.dart';
import 'package:technical_service_report/widget/back_button.dart';
import 'package:technical_service_report/widget/custom_textfield.dart';
import 'package:technical_service_report/widget/next_button.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen(
      {Key? key, required this.secondPage, required this.firstPage})
      : super(key: key);
  final SecondPage secondPage;
  final FirstPage firstPage;
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Analysis> analysisList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Analysis",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              if (analysisList.isEmpty) {
                var val = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAnalysisScreen()));
                if (val != null) {
                  setState(() {
                    analysisList.add(val);
                  });
                }
              }
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      analysisList.isNotEmpty
                          ? analysisList[0].title
                          : "Not Set",
                      style: TextStyle(fontSize: 15),
                    ),
                    RotatedBox(
                        quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                  ],
                )),
          ),
          GestureDetector(
            onTap: () async {
              if (analysisList.length < 2) {
                var val = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAnalysisScreen()));
                if (val != null) {
                  setState(() {
                    analysisList.add(val);
                  });
                }
              }
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      analysisList.length > 1
                          ? analysisList[1].title
                          : "Not Set",
                      style: TextStyle(fontSize: 15),
                    ),
                    RotatedBox(
                        quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                  ],
                )),
          ),
          GestureDetector(
            onTap: () async {
              if (analysisList.length < 3) {
                var val = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAnalysisScreen()));
                if (val != null) {
                  setState(() {
                    analysisList.add(val);
                  });
                }
              }
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      analysisList.length > 2
                          ? analysisList[2].title
                          : "Not Set",
                      style: TextStyle(fontSize: 15),
                    ),
                    RotatedBox(
                        quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                  ],
                )),
          ),
          GestureDetector(
            onTap: () async {
              if (analysisList.length < 4) {
                var val = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAnalysisScreen()));
                if (val != null) {
                  setState(() {
                    analysisList.add(val);
                  });
                }
              }
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      analysisList.length > 3
                          ? analysisList[3].title
                          : "Not Set",
                      style: TextStyle(fontSize: 15),
                    ),
                    RotatedBox(
                        quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              NextButton(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen(firstPage: widget.firstPage, secondPage: widget.secondPage, listAnalysis: analysisList)));
              }),
            ],
          )
        ],
      ),
    );
  }
}
