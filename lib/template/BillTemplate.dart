import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:invoice_app/localDb/InvoiceModel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';



// InvoiceModel(this.companyName, this.customerName, this.invoiceNumber, this.date, this.address, this.contactNumber, this.email, this.invoiceType, this.customerPhoneNumber, this.invoiceDetail, this.gstNumber, this.discount, this.sgstPercent, this.sgstAmount, this.cgstPercent, this.cgstAmount,this.invoiceTotal, this.termAndConditionList); taxableAmount

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
              Text("E-mail: ${invoice.email}", style: TextStyle(fontSize: 5)),
              Padding(padding: EdgeInsets.only(left: 10),
                child: Text(invoice.invoiceType, style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold)),)
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
                Text("Phone: ${invoice.customerPhoneNumber}", style: TextStyle(fontSize: 10),),
              ],),
          ),

          Container(
            width: 100,
            child: Table(
              children: [
                TableRow(
                    children: [
                      Text("Invoice No", style: TextStyle(fontSize: 9),),
                      Text(": ${invoice.invoiceNumber}", style: TextStyle(fontSize: 9),),
                    ]
                ),
                TableRow(
                    children: [
                      Text("Invoice Dt", style: TextStyle(fontSize: 9),),
                      Text(": ${invoice.date}", style: TextStyle(fontSize: 9),),
                    ]
                ),
                TableRow(
                    children: [
                      Text("Time", style: TextStyle(fontSize: 9),),
                      Text(": ", style: TextStyle(fontSize: 9),),
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

  Widget billBody(InvoiceModel invoice) {

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

          for(var i = 0; i < invoice.invoiceDetail.length; i++) TableRow(
              children: [

                Center(child: Text(invoice.invoiceDetail[i].srNumber,style: TextStyle(fontSize: 10))),
                Center(child: Text(invoice.invoiceDetail[i].description,style: TextStyle(fontSize: 10))),
                Center(child: Text(invoice.invoiceDetail[i].size,style: TextStyle(fontSize: 10))),
                Center(child: Text(invoice.invoiceDetail[i].qty,style: TextStyle(fontSize: 10))),
                Center(child: Text(invoice.invoiceDetail[i].rate,style: TextStyle(fontSize: 10))),
                Center(child: Text(invoice.invoiceDetail[i].total,style: TextStyle(fontSize: 10))),
              ]
          ),
        ],
      )
    ],
  );
}

  Future<Uint8List> getImageBytes(String assetImage) async {
    final ByteData bytes = await rootBundle.load(assetImage);
    final Uint8List byteList = bytes.buffer.asUint8List();
    return byteList;
  }

  Widget billFooter(InvoiceModel invoice) {
    return Column(
      children: [
        Divider(
          color: PdfColors.black,
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("GSTIN : ${invoice.gstNumber}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              Text("Less : ${invoice.discount}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            ]),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              child: Table(
                children: [
                  TableRow(
                    // taxable - 666, sgst - 2.5% 16 ,
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
                        Center(child: Text(invoice.taxableAmount, style: TextStyle(fontSize: 9))),
                        Center(child: Text(invoice.sgstPercent, style: TextStyle(fontSize: 9))),
                        Center(child: Text(invoice.sgstAmount, style: TextStyle(fontSize: 9))),
                        Center(child: Text(invoice.cgstPercent, style: TextStyle(fontSize: 9))),
                        Center(child: Text(invoice.cgstAmount, style: TextStyle(fontSize: 9)))
                      ]
                  ),

                ],
              ),
            ),
            Text("TOTAL : ${invoice.invoiceTotal}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for(var i = 0; i < invoice.termAndConditionList.length; i++) Text(invoice.termAndConditionList[i], textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9))
              ],
            ),
            Column(
              children: [
                Text("Certified that above information is true and correct", style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal)),
                Text("For ${invoice.companyName}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ]
    );
  }
}
