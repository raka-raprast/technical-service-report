// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:technical_service_report/models/parts.dart';
import 'package:technical_service_report/style/size.dart';
import 'package:technical_service_report/widget/custom_radio.dart';
import 'package:technical_service_report/widget/custom_textfield.dart';
import 'package:technical_service_report/widget/next_button.dart';

class PartDetailScreen extends StatefulWidget {
  const PartDetailScreen({Key? key, required this.part}) : super(key: key);
  final Part part;
  @override
  State<PartDetailScreen> createState() => _PartDetailScreenState();
}

class _PartDetailScreenState extends State<PartDetailScreen> {
  TextEditingController pnremoved = TextEditingController();
  TextEditingController pninstalled = TextEditingController();
  TextEditingController partName = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController repairAction = TextEditingController();
  bool removedGen = false;
  bool installedGen = false;
  @override
  void initState() {
    setState(() {
      pnremoved.text = widget.part.pnRemove;
      pninstalled.text = widget.part.pnInstalled;
      partName.text = widget.part.partName;
      qty.text = widget.part.qty.toString();
      repairAction.text = widget.part.repairAction;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Container(),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: pnremoved,
            title: 'P/N Removed',
          ),
          YesNoRadio(
              value: removedGen,
              onChanged: (val) {
                setState(() {
                  removedGen = val;
                });
              },
              title: "Genuinity"),
          CustomTextField(
            controller: pninstalled,
            title: 'P/N Installed',
          ),
          YesNoRadio(
              value: installedGen,
              onChanged: (val) {
                setState(() {
                  installedGen = val;
                });
              },
              title: "Genuinity"),
          CustomTextField(
            controller: partName,
            title: 'Part Name',
          ),
          CustomTextField(
            keyboardType: TextInputType.number,
            controller: qty,
            title: 'Qty',
          ),
          CustomTextField(
            controller: repairAction,
            title: 'Repair Actions',
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                    context,
                    Part(
                        installedGenuinity: installedGen,
                        partName: partName.text,
                        pnInstalled: pninstalled.text,
                        pnRemove: pnremoved.text,
                        qty: int.parse(qty.text),
                        removeGenuinity: removedGen,
                        repairAction: repairAction.text));
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
