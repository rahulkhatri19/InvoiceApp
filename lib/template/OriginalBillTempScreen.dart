import 'package:flutter/material.dart';

class OriginalBillTempScreen extends StatefulWidget {
  const OriginalBillTempScreen({super.key});

  @override
  State<OriginalBillTempScreen> createState() => _OriginalBillTempState();
}

class _OriginalBillTempState extends State<OriginalBillTempScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(width: 3.0, color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/image/rk_logo.png",
                        width: 40,
                        height: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "RK Softwares",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                              "A/12, Shrenik Park, GIDC Road, Opp. Jain Mandir, Akota, Vadodra",
                              style: TextStyle(fontSize: 8)),
                          Text("99000 00000, 88000 00000",
                              style: TextStyle(fontSize: 6)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("E-mail: rksoftwares@gmail.com", style: TextStyle(fontSize: 5)),
                              Padding(padding: EdgeInsets.only(left: 10),
                              child: Text("Tax Invoice", style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold)),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cash Bill", style: TextStyle(fontSize: 10),),
                          Text("Phone:", style: TextStyle(fontSize: 10),),
                      ],),
                    ),

                    Container(
                      width: 100,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              Text("Invoice No", style: TextStyle(fontSize: 9),),
                              Text(": 101", style: TextStyle(fontSize: 9),),
                            ]
                          ),
                          TableRow(
                            children: [
                              Text("Invoice Dt", style: TextStyle(fontSize: 9),),
                              Text(": 102", style: TextStyle(fontSize: 9),),
                            ]
                          ),
                          TableRow(
                              children: [
                                Text("Time", style: TextStyle(fontSize: 9),),
                                Text(": 103", style: TextStyle(fontSize: 9),),
                              ]
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0:FractionColumnWidth(0.1),
                      1:FractionColumnWidth(0.3),
                      2:FractionColumnWidth(0.15),
                      3:FractionColumnWidth(0.15),
                      4:FractionColumnWidth(0.15),
                      5:FractionColumnWidth(0.15),
                    },
                    children: [
                      TableRow(
                        children: [
                          Center(child: Text("Sr.",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),),
                          Center(child: Text("Description",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),),
                          Center(child: Text("Size",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),),
                          Center(child: Text("Qty",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),),
                          Center(child: Text("Rate",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),),
                          Center(child: Text("Total",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),),
                        ]
                      ),
                      TableRow(
                          children: [
                            Center(child: Text("1",style: TextStyle(fontSize: 10))),
                            Center(child: Text("T Shirt",style: TextStyle(fontSize: 10))),
                            Center(child: Text("XL",style: TextStyle(fontSize: 10))),
                            Center(child: Text("2",style: TextStyle(fontSize: 10))),
                            Center(child: Text("700.00",style: TextStyle(fontSize: 10))),
                            Center(child: Text("1400.00",style: TextStyle(fontSize: 10))),
                          ]
                      )
                    ],
                  ),
                ),
                SizedBox(height: 200),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("GSTIN : 29GGGGG1314R9Z6", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                  Text("Less : 0.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                ]),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Center(child: Text("Taxable", style: TextStyle(fontSize: 9))),
                            Center(child: Text("SGST%", style: TextStyle(fontSize: 9))),
                            Center(child: Text("Amt.", style: TextStyle(fontSize: 9))),
                            Center(child: Text("CGST%", style: TextStyle(fontSize: 9))),
                            Center(child: Text("Amt.", style: TextStyle(fontSize: 9)))
                          ]
                        ),
                        TableRow(
                          children: [
                            Center(child: Text("666", style: TextStyle(fontSize: 9))),
                            Center(child: Text("2.5%", style: TextStyle(fontSize: 9))),
                            Center(child: Text("16.00", style: TextStyle(fontSize: 9))),
                            Center(child: Text("2.5%", style: TextStyle(fontSize: 9))),
                            Center(child: Text("16.00", style: TextStyle(fontSize: 9)))
                          ]
                        ),

                      ],
                    ),
                  ),
                    Text("TOTAL : 667.00", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Term & Conditions E.& O.E.", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9)),

                        Text("1. That is returned after 7 Days from purchase date", textAlign: TextAlign.start, style: TextStyle(fontSize: 9)),

                        Text("2. That does not have a valid product receipt.", textAlign: TextAlign.start, style: TextStyle(fontSize: 9)),

                        Text("3. That does not have original hangtags barcodes.", style: TextStyle(fontSize: 9)),

                        Text("4. That is not in the original condition, is damages or is missing part. ", style: TextStyle(fontSize: 9)),

                        Text("5. That has been used or washed after purchase.", style: TextStyle(fontSize: 9)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Certified that above information is true and correct", style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal)),
                        Text("For RK Software", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
