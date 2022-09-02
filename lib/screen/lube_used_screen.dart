// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:technical_service_report/models/lube.dart';
import 'package:technical_service_report/widget/custom_textfield.dart';
import 'package:technical_service_report/widget/next_button.dart';

import '../style/size.dart';

class LubeUsedScreen extends StatefulWidget {
  const LubeUsedScreen({Key? key, required this.title, required this.lubeUsed})
      : super(key: key);
  final String title;
  final LubeUsed lubeUsed;
  @override
  State<LubeUsedScreen> createState() => _LubeUsedScreenState();
}

class _LubeUsedScreenState extends State<LubeUsedScreen> {
  TextEditingController makeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController saeController = TextEditingController();
  TextEditingController classController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Container(),
          ),
          Center(child: Text(widget.title)),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: makeController,
            title: 'Make',
          ),
          CustomTextField(
            controller: typeController,
            title: 'Type',
          ),
          CustomTextField(
            controller: saeController,
            title: 'SAE No.',
          ),
          CustomTextField(
            controller: classController,
            title: 'Class',
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                    context,
                    Lube(
                        lubeUsed: widget.lubeUsed,
                        cl: classController.text,
                        make: makeController.text,
                        sae: saeController.text,
                        type: typeController.text));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Done")),
            ),
          )
        ],
      ),
    );
  }
}
