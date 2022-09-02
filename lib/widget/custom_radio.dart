// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class YesNoRadio extends StatefulWidget {
  const YesNoRadio(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.title})
      : super(key: key);
  final bool value;
  final Function(bool) onChanged;
  final String title;
  @override
  State<YesNoRadio> createState() => _YesNoRadioState();
}

class _YesNoRadioState extends State<YesNoRadio> {
  bool selected = false;
  @override
  void initState() {
    setState(() {
      selected = widget.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onChanged(true);
                },
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(100)),
                      child: widget.value
                          ? Container(
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(),
                                  color: Colors.grey),
                            )
                          : null,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Yes"),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  widget.onChanged(false);
                },
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(100)),
                      child: !widget.value
                          ? Container(
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(),
                                  color: Colors.grey),
                            )
                          : null,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("No")
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
