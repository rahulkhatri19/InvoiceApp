import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:invoice_app/localDb/InvoiceModel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// InvoiceModel("RK Software", "Awwa Shop", "101", "06 June 24", "A/12, Shrenik Park, GIDC Road, Opp. Jain Mandir, Akota, Vadodra", "99000 00000, 88000 00000", "", "", "", "", "", "", "", "", "", "", "", );

// InvoiceModel(this.companyName, this.customerName, this.invoiceNumber, this.date, this.address, this.contactNumber, this.email, this.invoiceType, this.customerPhoneNumber, this.invoiceDetail, this.gstNumber, this.discount, this.sgstPercent, this.sgstAmount, this.cgstPercent, this.cgstAmount,this.invoiceTotal, this.termAndConditionList);

class BillTemplate {
  Widget billHeader(InvoiceModel invoice) => Column(
    children: [
      Padding(padding: EdgeInsets.only(top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            invoice.companyName,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
              invoice.address,
              style: TextStyle(fontSize: 8)),
          Text(invoice.contactNumber,
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
      ),
      Divider(
        color: PdfColors.black,
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
      Divider(
        color: PdfColors.black,
      ),
    ]
  );

  Widget billBody() {

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Table(
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
          for(var i = 0; i < 30; i++) TableRow(
              children: [
                Center(child: Text("${i+1}",style: TextStyle(fontSize: 10))),
                Center(child: Text("T Shirt",style: TextStyle(fontSize: 10))),
                Center(child: Text("XL",style: TextStyle(fontSize: 10))),
                Center(child: Text("2",style: TextStyle(fontSize: 10))),
                Center(child: Text("700.00",style: TextStyle(fontSize: 10))),
                Center(child: Text("1400.00",style: TextStyle(fontSize: 10))),
              ]
          ),
        ],
      ),
      Table(
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
          for(var i = 0; i < 30; i++) TableRow(
              children: [
                Center(child: Text("${i+1}",style: TextStyle(fontSize: 10))),
                Center(child: Text("T Shirt",style: TextStyle(fontSize: 10))),
                Center(child: Text("XL",style: TextStyle(fontSize: 10))),
                Center(child: Text("2",style: TextStyle(fontSize: 10))),
                Center(child: Text("700.00",style: TextStyle(fontSize: 10))),
                Center(child: Text("1400.00",style: TextStyle(fontSize: 10))),
              ]
          ),
        ],
      ),
      Container(
        child: Text("")
      )
    ],
  );
}

  Future<Uint8List> getImageBytes(String assetImage) async {
    final ByteData bytes = await rootBundle.load(assetImage);
    final Uint8List byteList = bytes.buffer.asUint8List();
    return byteList;
  }

  Widget billFooter() {
    return Column(
      children: [
        Divider(
          color: PdfColors.black,
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
      ]
    );
  }

  static Widget buildInvoice() {
    final headers = [
      'Description',
      'Date',
      'Quantity',
      'Unit Price',
      'VAT',
      'Total'
    ];
    final data = [].toList();
    // final data = invoice.items.map((item) {
    //   final total = item.unitPrice * item.quantity * (1 + item.vat);
    //
    //   return [
    //     item.description,
    //     Utils.formatDate(item.date),
    //     '${item.quantity}',
    //     '\$ ${item.unitPrice}',
    //     '${item.vat} %',
    //     '\$ ${total.toStringAsFixed(2)}',
    //   ];
    // }).toList();

    return TableHelper.fromTextArray(
      headers: headers,
      data: [data],
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }
}
