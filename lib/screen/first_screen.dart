// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_service_report/screen/pdf_screen.dart';
import 'package:technical_service_report/screen/second_screen.dart';
import 'package:technical_service_report/style/color.dart';
import 'package:technical_service_report/style/size.dart';
import 'package:technical_service_report/widget/back_button.dart';
import 'package:technical_service_report/widget/custom_textfield.dart';
import 'package:technical_service_report/widget/next_button.dart';

import '../models/firstpage.dart';

enum FirstScreenState { log, first, second, third, forth, fifth, sixth }

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController reportNumber = TextEditingController();
  TextEditingController product = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController machineMake = TextEditingController();
  TextEditingController customerBusiness = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController machineLocation = TextEditingController();
  TextEditingController mileage = TextEditingController();
  TextEditingController machineModel = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController engineModel = TextEditingController();
  TextEditingController engineNumber = TextEditingController();
  TextEditingController conceptClaimNo = TextEditingController();
  TextEditingController claimYear = TextEditingController();
  TextEditingController claimMonth = TextEditingController();
  TextEditingController claimDate = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController serialNo = TextEditingController();
  TextEditingController smrhrs = TextEditingController();
  TextEditingController smrkm = TextEditingController();
  TextEditingController deliveryDate = TextEditingController();
  TextEditingController troubleDate = TextEditingController();
  TextEditingController correctedDate = TextEditingController();
  TextEditingController payload = TextEditingController();
  TextEditingController materialCarriage = TextEditingController();
  TextEditingController maxSpeed = TextEditingController();
  TextEditingController averageSpeed = TextEditingController();
  TextEditingController application = TextEditingController();
  TextEditingController workingCondition = TextEditingController();
  TextEditingController groundCondition = TextEditingController();
  TextEditingController environment = TextEditingController();
  TextEditingController complaint = TextEditingController();
  TextEditingController totalMachineOwned = TextEditingController();
  TextEditingController theSameProblem = TextEditingController();
  TextEditingController causingPart = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController component = TextEditingController();
  TextEditingController mic = TextEditingController();
  TextEditingController mid = TextEditingController();
  final List<String> _claimabelChips = ['Claimable', 'Information only'];
  final List<String> _selectedClaimable = <String>[];
  final List<String> _ptmChips = ['Part', 'Technical', 'Modification'];
  final List<String> _selectedPtm = <String>[];
  final List<String> _failureChip = [
    'Burn',
    'Bend',
    'Broken',
    'Crack',
    'Dent',
    'Loose',
    'Scratch',
    'Short',
    'Pitting',
    'Rusty',
    'Worn',
    'Others'
  ];
  final List<String> _selectedFailure = <String>[];
  var attachments = [
    'Standard',
    'Optional',
  ]; // Initial Selected Value
  String attachmentVal = 'Standard';
  FirstScreenState state = FirstScreenState.log;
  Iterable<Widget> get failureWidget {
    return _failureChip.map((chip) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(chip),
          selected: _selectedFailure.contains(chip),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _selectedFailure.add(chip);
              } else {
                _selectedFailure.removeWhere((String name) {
                  return name == chip;
                });
              }
            });
          },
        ),
      );
    });
  }

  Iterable<Widget> get claimableWidgets {
    return _claimabelChips.map((chip) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(chip),
          selected: _selectedClaimable.contains(chip),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _selectedClaimable.add(chip);
              } else {
                _selectedClaimable.removeWhere((String name) {
                  return name == chip;
                });
              }
            });
          },
        ),
      );
    });
  }

  Iterable<Widget> get ptmWidget {
    return _ptmChips.map((chip) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(chip),
          selected: _selectedPtm.contains(chip),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _selectedPtm.add(chip);
              } else {
                _selectedPtm.removeWhere((String name) {
                  return name == chip;
                });
              }
            });
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    switch (state) {
      case FirstScreenState.log:
        return _log();
      case FirstScreenState.first:
        return _first();
      case FirstScreenState.second:
        return _second();
      case FirstScreenState.third:
        return _third();
      case FirstScreenState.forth:
        return _forth();
      case FirstScreenState.fifth:
        return _fifth();
      case FirstScreenState.sixth:
        return _sixth();
    }
  }

  Widget _log() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: mic,
          title: 'Mechanic In Charge',
        ),
        CustomTextField(
          controller: mid,
          title: 'Mechanic Id',
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
                  state = FirstScreenState.first;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _first() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: reportNumber,
          title: 'Report Number',
        ),
        CustomTextField(
          controller: product,
          title: 'Product',
        ),
        CustomTextField(
          controller: year,
          title: 'Year',
        ),
        CustomTextField(
          controller: month,
          title: 'Month',
        ),
        CustomTextField(
          controller: date,
          title: 'Date',
        ),
        CustomTextField(
          controller: branch,
          title: 'Branch',
        ),
        CustomTextField(
          controller: machineMake,
          title: 'Machine Make',
        ),
        CustomTextField(
          controller: customerBusiness,
          title: 'Customer Business',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = FirstScreenState.log;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = FirstScreenState.second;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _second() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: customerName,
          title: 'Customer Name',
        ),
        CustomTextField(
          controller: machineLocation,
          title: 'Machine Location',
        ),
        CustomTextField(
          controller: mileage,
          title: 'Mileage',
        ),
        CustomTextField(
          controller: machineModel,
          title: 'Machine Model',
        ),
        CustomTextField(
          controller: name,
          title: 'Name',
        ),
        CustomTextField(
          controller: make,
          title: 'Make',
        ),
        CustomTextField(
          controller: engineModel,
          title: 'Engine Model',
        ),
        CustomTextField(
          controller: engineNumber,
          title: 'Engine Number',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = FirstScreenState.first;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = FirstScreenState.third;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _third() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          height: screenHeight(context) * .05,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: claimableWidgets.toList(),
          ),
        ),
        CustomTextField(
          controller: conceptClaimNo,
          title: 'Concept Claim No.',
        ),
        CustomTextField(
          controller: claimYear,
          title: 'Year',
        ),
        CustomTextField(
          controller: claimMonth,
          title: 'Month',
        ),
        CustomTextField(
          controller: claimDate,
          title: 'Date',
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          height: screenHeight(context) * .05,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ptmWidget.toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = FirstScreenState.second;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = FirstScreenState.forth;
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
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Attachment",
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
              value: attachmentVal,
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              items: attachments.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  attachmentVal = newValue!;
                });
              },
            ),
          ),
        ),
        CustomTextField(
          controller: model,
          title: 'Model',
        ),
        CustomTextField(
          controller: serialNo,
          title: 'Serial No.',
        ),
        CustomTextField(
          controller: smrhrs,
          title: 'SMR/HRS',
        ),
        CustomTextField(
          controller: smrkm,
          title: 'SMR/KM',
        ),
        CustomTextField(
          controller: deliveryDate,
          title: 'Delivery Date',
        ),
        CustomTextField(
          controller: troubleDate,
          title: 'Trouble Date',
        ),
        CustomTextField(
          controller: correctedDate,
          title: 'Corrected Date',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = FirstScreenState.third;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = FirstScreenState.fifth;
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
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: payload,
          title: 'Payload',
        ),
        CustomTextField(
          controller: materialCarriage,
          title: 'Material Carriage',
        ),
        CustomTextField(
          controller: maxSpeed,
          title: 'Max Speed',
        ),
        CustomTextField(
          controller: averageSpeed,
          title: 'Average Speed',
        ),
        CustomTextField(
          controller: application,
          title: 'Application',
        ),
        CustomTextField(
          controller: workingCondition,
          title: 'Working Condition',
        ),
        CustomTextField(
          controller: groundCondition,
          title: 'Ground Condition',
        ),
        CustomTextField(
          controller: environment,
          title: 'Environment',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = FirstScreenState.forth;
              });
            }),
            NextButton(
              onTap: () {
                setState(() {
                  state = FirstScreenState.sixth;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _sixth() {
    return ListView(
      children: [
        SafeArea(
          child: Container(),
        ),
        SizedBox(
            height: screenWidth(context) * .2,
            width: screenWidth(context) * .2,
            child: Image.asset("lib/assets/ic_2.png")),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: complaint,
          title: 'Complaint',
        ),
        CustomTextField(
          controller: totalMachineOwned,
          title: 'Total Machine Owned',
        ),
        CustomTextField(
          controller: theSameProblem,
          title: 'The Same Problem',
        ),
        CustomTextField(
          controller: causingPart,
          title: 'Causing Part',
        ),
        CustomTextField(
          controller: description,
          title: 'Description',
        ),
        CustomTextField(
          controller: component,
          title: 'Component',
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Failure",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: screenHeight(context) * .05,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: failureWidget.toList(),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousButton(onTap: () {
              setState(() {
                state = FirstScreenState.fifth;
              });
            }),
            NextButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                            firstPageComponent: FirstPage(
                                reportNumber: reportNumber.text,
                                product: product.text,
                                year: year.text,
                                month: month.text,
                                date: date.text,
                                branch: branch.text,
                                machineMake: machineMake.text,
                                customerBusiness: customerBusiness.text,
                                customerName: customerName.text,
                                machineLocation: machineLocation.text,
                                mileage: mileage.text,
                                machineModel: machineModel.text,
                                name: name.text,
                                make: make.text,
                                engineModel: engineModel.text,
                                engineNumber: engineNumber.text,
                                claimability: _selectedClaimable,
                                conceptClaimNo: conceptClaimNo.text,
                                claimYear: claimYear.text,
                                claimMonth: claimMonth.text,
                                claimDate: claimDate.text,
                                partDetail: _selectedPtm,
                                attachment: attachmentVal,
                                model: model.text,
                                serialNo: serialNo.text,
                                smrHrs: smrhrs.text,
                                smrKm: smrkm.text,
                                deliveryDate: deliveryDate.text,
                                troubleDate: troubleDate.text,
                                correctedDate: correctedDate.text,
                                payload: payload.text,
                                mateialCarriage: materialCarriage.text,
                                maxSpeed: maxSpeed.text,
                                averageSpeed: averageSpeed.text,
                                application: application.text,
                                workingCondition: workingCondition.text,
                                groundCondition: groundCondition.text,
                                environment: environment.text,
                                complaint: complaint.text,
                                totalMachineOwned: totalMachineOwned.text,
                                theSameProblem: theSameProblem.text,
                                causingPart: causingPart.text,
                                description: description.text,
                                component: component.text,
                                failure: _selectedFailure,
                                mechanicInCharge: mic.text,
                                mechanicId: mid.text))));
              },
            ),
          ],
        )
      ],
    );
  }
}
