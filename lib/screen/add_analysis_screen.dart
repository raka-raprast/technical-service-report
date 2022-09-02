// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_service_report/models/analysis.dart';
import 'package:technical_service_report/style/size.dart';
import 'package:technical_service_report/widget/custom_textfield.dart';

class AddAnalysisScreen extends StatefulWidget {
  const AddAnalysisScreen({Key? key}) : super(key: key);

  @override
  State<AddAnalysisScreen> createState() => _AddAnalysisScreenState();
}

class _AddAnalysisScreenState extends State<AddAnalysisScreen> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Container(),
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            controller: titleController,
            title: 'Title',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Image",
              style: TextStyle(fontSize: 15),
            ),
          ),
          GestureDetector(
            onTap: () {
              pickImage();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: screenWidth(context) * .8,
                  height: screenWidth(context) * .8,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: image != null
                        ? Image.file(
                            image!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "lib/assets/ic_3.png",
                          ),
                  )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                    context,
                    Analysis(
                        title: titleController.text,
                        description: descriptionController.text,
                        image: image));
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
