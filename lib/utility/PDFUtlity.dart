
import 'dart:io';
import 'dart:typed_data';
import 'package:invoice_app/template/BillTemplate.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';


class PDFUtility{
  final BillTemplate billTemp = BillTemplate();
  Future<Uint8List> generatePdf(){
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) => [billTemp.billBody()],
        header: (Context context) => billTemp.billHeader(),
        footer: (Context context) => billTemp.billFooter()));
    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }
}