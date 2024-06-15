
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
    for(var i = 0; i < 30; i++) {
      invoiceDetailList.add(InvoiceDetail("T Shirt", "XL", "2", "700.00", "1400.00"));
    }

    final InvoiceModel invoiceModel = InvoiceModel("Awwa Shop", "004", "02 June 2024", invoiceDetailList);

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
                              final data = await pdfUtility.generatePdf();
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