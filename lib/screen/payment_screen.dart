// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:technical_service_report/models/analysis.dart';
import 'package:technical_service_report/models/firstpage.dart';
import 'package:technical_service_report/models/secondpage.dart';
import 'package:technical_service_report/screen/payment_widget_screen.dart';
import 'package:technical_service_report/screen/pdf_screen.dart';

import '../models/payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.firstPage, required this.secondPage, required this.listAnalysis}) : super(key: key);
  final FirstPage firstPage;
  final SecondPage secondPage;
  final List<Analysis> listAnalysis;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<Payment> paymentList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Payment"),
            ),
            Container(
              // color: Colors.red,
              decoration: BoxDecoration(border: Border.all()),
              height: 300,
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: paymentList.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onLongPress: (){
                           setState(() {
                             paymentList.remove(paymentList[i]);
                           });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text(paymentList[i].description!), Text("Rp.${paymentList[i].price.toString()}")],), Text("${paymentList[i].qty.toString()}x")]),
                            ),
                          ),
                        );
                      }),
                  GestureDetector(
                      onTap: () async {
                       var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentWidgetScreen()));
                       if(res != null) {
                         setState(() {
                           paymentList.add(res);
                         });
                       }
                      },
                      child: Text("Add")),
                ],
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                createPDF(context, widget.firstPage, widget.secondPage, widget.listAnalysis);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(15)),
              child: Text("Done"),),)
          ],
        ),
      ),
    );
  }
}
