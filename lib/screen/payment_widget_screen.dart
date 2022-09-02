// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:technical_service_report/data/fake_data.dart';

import '../models/payment.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class PaymentWidgetScreen extends StatefulWidget {
  const PaymentWidgetScreen({Key? key}) : super(key: key);

  @override
  State<PaymentWidgetScreen> createState() => _PaymentWidgetScreenState();
}

class _PaymentWidgetScreenState extends State<PaymentWidgetScreen> {
  String dropdownValue = "Gasket Kit";
  List<String> dropdownList = [];
  int price = 0;
  @override
  void initState() {
    setState(() {
      dropdownList = temporaryPaymentData.map((e) => e.description!).toList();
      price = temporaryPaymentData.where((element) => element.description == dropdownValue).first.price!;
    });
    super.initState();
  }
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(child: Text("Payment Detail")),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(border: Border.all()),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                // elevation: 16,

                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                    price = temporaryPaymentData.where((element) => element.description == value).first.price!;
                  });
                },
                items:
                    dropdownList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Part",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(temporaryPaymentData
                    .where((element) => element.description == dropdownValue)
                    .first
                    .description!)),
            SizedBox(
              height: 15,
            ),
            Text(
              "Harga",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                  "Rp.${temporaryPaymentData.where((element) => element.description == dropdownValue).first.price!}"),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                GestureDetector(onTap: (){
                  if (qty != 0) {
                    setState(() {
                      qty = qty -1;
                    });
                  }
                }, child: Icon(
                  Icons.remove,
                ),),
                SizedBox(
                  width: 10,
                ),
                Text(qty.toString()),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(onTap: (){
                  if(qty < 99) {
                    setState(() {
                      qty = qty +1;
                    });
                  }
                }, child: Icon(
                  Icons.add,
                ),),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                      context,
                      Payment(description : dropdownValue, price: price, qty: qty));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text("Add")),
              ),
            )
          ],
        ),
      )),
    );
  }
}
