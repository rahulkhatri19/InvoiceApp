import 'package:flutter/material.dart';
import 'package:invoice_app/template/OriginalBillTempScreen.dart';
import 'package:invoice_app/utility/PDFUtlity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  final PDFUtility pdfUtility = PDFUtility();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Generator"),),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async{
             // final data = await pdfUtility.generatePdf();
             // pdfUtility.savePdfFile("Hello PDF", data);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const OriginalBillTempScreen()),
              // );
            },
            child: const Text("Generate PDF"),
          ),
        ),
      ),
    );
  }
}