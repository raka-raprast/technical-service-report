// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:technical_service_report/models/firstpage.dart';
import 'package:technical_service_report/models/lube.dart';
import 'package:technical_service_report/models/secondpage.dart';
import 'package:technical_service_report/screen/lube_used_screen.dart';
import 'package:technical_service_report/screen/part_detail_screen.dart';
import 'package:technical_service_report/screen/third_screen.dart';
import 'package:technical_service_report/style/size.dart';
import 'package:technical_service_report/widget/back_button.dart';
import 'package:technical_service_report/widget/custom_radio.dart';
import 'package:technical_service_report/widget/custom_textfield.dart';
import 'package:technical_service_report/widget/more_detail.dart';
import 'package:technical_service_report/widget/next_button.dart';

import '../models/parts.dart';

enum SecondScreenState { first, second, third, forth, fifth }

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.firstPageComponent})
      : super(key: key);
  final FirstPage firstPageComponent;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool misoperation = false;
  bool mismaintenance = false;
  bool misadjusment = false;
  bool poorTorque = false;
  bool badWeld = false;
  bool poorWeld = false;
  bool badMaterial = false;
  bool dirtyFuel = false;
  bool misassembly = false;
  bool foreignMaterial = false;
  bool poorDurability = false;
  bool fatiqueMaterial = false;
  var items = [
    'Finish',
    'Not Finish',
  ];
  String dropdownvalue = 'Not Finish';
  List<Lube> lubeList = [];
  List<Part> partList = [];
  SecondScreenState state = SecondScreenState.first;
  TextEditingController incNo = TextEditingController();
  TextEditingController sroNo = TextEditingController();
  TextEditingController toNo = TextEditingController();
  TextEditingController remedy = TextEditingController();
  TextEditingController manhour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: _buildBody(),
        onWillPop: () async {
          return false;
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (state) {
      case SecondScreenState.first:
        return _first();
      case SecondScreenState.second:
        return _second();
      case SecondScreenState.third:
        return _third();
      case SecondScreenState.forth:
        return _forth();
      case SecondScreenState.fifth:
        return _fifth();
    }
  }

  Widget _first() {
    return Column(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_1.png")),
        Text(
          "Cause",
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 40,
        ),
        YesNoRadio(
          title: "Misoperation",
          onChanged: (val) {
            setState(() {
              misoperation = val;
            });
          },
          value: misoperation,
        ),
        YesNoRadio(
          title: "Mismaintenance",
          onChanged: (val) {
            setState(() {
              mismaintenance = val;
            });
          },
          value: mismaintenance,
        ),
        YesNoRadio(
          title: "Misadjusment",
          onChanged: (val) {
            setState(() {
              misadjusment = val;
            });
          },
          value: misadjusment,
        ),
        YesNoRadio(
          title: "Poor Torque",
          onChanged: (val) {
            setState(() {
              poorTorque = val;
            });
          },
          value: poorTorque,
        ),
        YesNoRadio(
          title: "Bad Weld",
          onChanged: (val) {
            setState(() {
              badWeld = val;
            });
          },
          value: badWeld,
        ),
        YesNoRadio(
          title: "Poor Weld",
          onChanged: (val) {
            setState(() {
              poorWeld = val;
            });
          },
          value: poorWeld,
        ),
        YesNoRadio(
          title: "Bad Material",
          onChanged: (val) {
            setState(() {
              badMaterial = val;
            });
          },
          value: badMaterial,
        ),
        YesNoRadio(
          title: "Dirty Fuel",
          onChanged: (val) {
            setState(() {
              dirtyFuel = val;
            });
          },
          value: dirtyFuel,
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              Navigator.pop(context);
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = SecondScreenState.second;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _second() {
    return Column(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_1.png")),
        SizedBox(
          height: 40,
        ),
        Text(
          "Cause",
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 40,
        ),
        YesNoRadio(
          title: "Misassembly",
          onChanged: (val) {
            setState(() {
              misassembly = val;
            });
          },
          value: misassembly,
        ),
        YesNoRadio(
          title: "Foreign Material",
          onChanged: (val) {
            setState(() {
              foreignMaterial = val;
            });
          },
          value: foreignMaterial,
        ),
        YesNoRadio(
          title: "Poor Durability",
          onChanged: (val) {
            setState(() {
              poorDurability = val;
            });
          },
          value: poorDurability,
        ),
        YesNoRadio(
          title: "Fatique Material",
          onChanged: (val) {
            setState(() {
              fatiqueMaterial = val;
            });
          },
          value: fatiqueMaterial,
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = SecondScreenState.first;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = SecondScreenState.third;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _third() {
    return Column(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_1.png")),
        SizedBox(
          height: 40,
        ),
        Text(
          "Part Replacement",
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PartDetailScreen(
                          part: partList.isEmpty
                              ? Part(
                                  installedGenuinity: false,
                                  partName: '',
                                  pnInstalled: '',
                                  pnRemove: '',
                                  qty: 0,
                                  removeGenuinity: false,
                                  repairAction: '',
                                )
                              : partList[0],
                        )));
            if (val != null) {
              setState(() {
                partList.add(val);
              });
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
                    partList.isNotEmpty ? partList[0].partName : "Not Set",
                    style: TextStyle(fontSize: 15),
                  ),
                  RotatedBox(quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                ],
              )),
        ),
        GestureDetector(
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PartDetailScreen(
                          part: partList.length > 1
                              ? partList[1]
                              : Part(
                                  installedGenuinity: false,
                                  partName: '',
                                  pnInstalled: '',
                                  pnRemove: '',
                                  qty: 0,
                                  removeGenuinity: false,
                                  repairAction: '',
                                ),
                        )));
            setState(() {
              partList.add(val);
            });
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
                    partList.length > 1 ? partList[1].partName : "Not Set",
                    style: TextStyle(fontSize: 15),
                  ),
                  RotatedBox(quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                ],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = SecondScreenState.second;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = SecondScreenState.forth;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _forth() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_1.png")),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Progress",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: DropdownButton(
              isExpanded: true,
              underline: Container(),
              value: dropdownvalue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MoreDetail(
          title: lubeList
                  .any((element) => element.lubeUsed == LubeUsed.engineOil)
              ? lubeList
                  .where((element) => element.lubeUsed == LubeUsed.engineOil)
                  .first
                  .make
              : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Engine Oil",
                          lubeUsed: LubeUsed.engineOil,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Engine Oil',
        ),
        MoreDetail(
          title: lubeList
                  .any((element) => element.lubeUsed == LubeUsed.swingReduction)
              ? lubeList
                  .where(
                      (element) => element.lubeUsed == LubeUsed.swingReduction)
                  .first
                  .make
              : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Swing Reduction",
                          lubeUsed: LubeUsed.swingReduction,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Swing  Reduction',
        ),
        MoreDetail(
          title: lubeList.any((element) => element.lubeUsed == LubeUsed.gearOil)
              ? lubeList
                  .where((element) => element.lubeUsed == LubeUsed.gearOil)
                  .first
                  .make
              : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Gear Oil",
                          lubeUsed: LubeUsed.gearOil,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Gear Oil',
        ),
        MoreDetail(
          title: lubeList
                  .any((element) => element.lubeUsed == LubeUsed.finalDrive)
              ? lubeList
                  .where((element) => element.lubeUsed == LubeUsed.finalDrive)
                  .first
                  .make
              : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Final Drive",
                          lubeUsed: LubeUsed.finalDrive,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Final Drive',
        ),
        MoreDetail(
          title: lubeList
                  .any((element) => element.lubeUsed == LubeUsed.hydraulicOil)
              ? lubeList
                  .where((element) => element.lubeUsed == LubeUsed.hydraulicOil)
                  .first
                  .make
              : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Hydraulic Oil",
                          lubeUsed: LubeUsed.hydraulicOil,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Hydraulic Oil',
        ),
        MoreDetail(
          title:
              lubeList.any((element) => element.lubeUsed == LubeUsed.steering)
                  ? lubeList
                      .where((element) => element.lubeUsed == LubeUsed.steering)
                      .first
                      .make
                  : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Steering",
                          lubeUsed: LubeUsed.steering,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Steering',
        ),
        MoreDetail(
          title: lubeList.any((element) => element.lubeUsed == LubeUsed.grease)
              ? lubeList
                  .where((element) => element.lubeUsed == LubeUsed.grease)
                  .first
                  .make
              : "Not Set",
          onTap: () async {
            var val = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LubeUsedScreen(
                          title: "Grease",
                          lubeUsed: LubeUsed.grease,
                        )));
            setState(() {
              lubeList.add(val);
            });
          },
          head: 'Grease',
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = SecondScreenState.third;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = SecondScreenState.fifth;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _fifth() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_1.png")),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: incNo,
          title: 'Inc No.',
        ),
        CustomTextField(
          controller: sroNo,
          title: 'SRO No.',
        ),
        CustomTextField(
          controller: toNo,
          title: 'TO No.',
        ),
        CustomTextField(
          controller: remedy,
          title: 'Remedy',
        ),
        CustomTextField(
          controller: manhour,
          title: 'Manhours',
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = SecondScreenState.forth;
              });
            }),
            NextButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdScreen(
                              secondPage: SecondPage(
                                  misoperation: misoperation,
                                  mismaintenance: mismaintenance,
                                  misadjusment: misadjusment,
                                  poorTorque: poorTorque,
                                  badWeld: badWeld,
                                  poorWeld: poorWeld,
                                  badMaterial: badMaterial,
                                  dirtyFuel: dirtyFuel,
                                  misassembly: misassembly,
                                  foreignMaterial: foreignMaterial,
                                  poorDurability: poorDurability,
                                  fatiqueMaterial: fatiqueMaterial,
                                  parts: partList,
                                  lubes: lubeList,
                                  remedy: remedy.text,
                                  status: dropdownvalue == "Finish",
                                  manhours: manhour.text),
                              firstPage: widget.firstPageComponent,
                            )));
              },
            ),
          ],
        )
      ],
    );
  }
}
