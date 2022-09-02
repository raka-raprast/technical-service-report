// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:technical_service_report/style/size.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30, bottom: 50),
      child: Align(
        alignment: Alignment.centerRight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: screenWidth(context) * .175,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next"),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "lib/assets/next_ic.png",
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
