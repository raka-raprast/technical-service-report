// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:technical_service_report/screen/first_screen.dart';
import 'package:technical_service_report/screen/second_screen.dart';
import 'package:technical_service_report/screen/third_screen.dart';
import 'package:technical_service_report/style/color.dart';
import 'package:technical_service_report/style/size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth(context),
            height: screenWidth(context),
            color: skyBlue(),
            child: Image.asset('lib/assets/dosan.png'),
          ),
          Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(), bottom: BorderSide())),
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.symmetric(vertical: 40),
            child: Center(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("Create Report")),
            )),
          )
        ],
      ),
    );
  }
}
