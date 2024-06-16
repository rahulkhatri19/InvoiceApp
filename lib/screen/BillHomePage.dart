
import 'package:flutter/material.dart';
import 'package:invoice_app/localDb/InvoiceModel.dart';
import 'package:invoice_app/screen/AddBillPage.dart';
import 'package:invoice_app/utility/PDFUtlity.dart';

class BillHomePage extends StatefulWidget {
  const BillHomePage({super.key});

  @override
  State<BillHomePage> createState() => _BillHomePage();
}

class _BillHomePage extends State<BillHomePage> {

  final PDFUtility pdfUtility = PDFUtility();

  List<InvoiceDetail> invoiceDetailList = [];

  @override
  Widget build(BuildContext context) {
    for(var i = 0; i < 18; i++) {
      invoiceDetailList.add(InvoiceDetail("${i+1}", "T Shirt", "XL", "2", "700.00", "1400.00"));
    }
    List<String> termConditionList = [];
    termConditionList.add("Term & Conditions E.& O.E.");
    termConditionList.add("1. That is returned after 7 Days from purchase date.");
    termConditionList.add("2. That does not have a valid product receipt.");
    termConditionList.add("3. That does not have original hangtags barcodes.");
    termConditionList.add("4. That is not in the original condition, is damages or is missing part.");
    termConditionList.add("5. That has been used or washed after purchase.");


    final InvoiceModel invoiceModel = InvoiceModel("RK Software", "Awwa Shop", "101", "06 June 24", "A/12, Shrenik Park, GIDC Road, Opp. Jain Mandir, Akota, Vadodra", "99000 00000, 88000 00000", "rksoftwares@gmail.com", "Tax Invoice", "99000 00000", invoiceDetailList, "29GGGGG1314R9Z6", "0.00", "2.5%", "16", "2.5%", "16", "667", "666", termConditionList);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice App"),
        backgroundColor: Colors.yellow[400],
        centerTitle: true,
      ),
      body: SafeArea(child:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(invoiceModel.customerName, style: TextStyle( fontSize: 15),),
                      Text("Invoice number : ${invoiceModel.invoiceNumber}", style: TextStyle( fontSize: 14),),
                      Text("Date : ${invoiceModel.date}", style: TextStyle( fontSize: 13)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.yellow[500])
                            ),
                            onPressed: () async {
                              final data = await pdfUtility.generatePdf(invoiceModel);
                              pdfUtility.savePdfFile("Hello PDF", data);
                            }, child:
                        Text("Invoice Pdf", style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold
                        ))),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.yellow[500])
                            ),
                            onPressed: (){

                            }, child:
                        Text("Edit Invoice", style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold
                        )))
                      ],)
                    ],
                  ),
              ),
            ),
          )
        ],
      )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(Icons.add),
        onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddBillPage()));
      },
      ),
    );
  }
}