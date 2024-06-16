class InvoiceModel {
  String companyName;
  String customerName;
  String invoiceNumber;
  String date;
  String address;
  String contactNumber;
  String email;
  String invoiceType;
  String customerPhoneNumber;
  List<InvoiceDetail> invoiceDetail;
  String gstNumber;
  String discount;
  String sgstPercent;
  String sgstAmount;
  String cgstPercent;
  String cgstAmount;
  String invoiceTotal;
  String taxableAmount;
  List<String> termAndConditionList;

  InvoiceModel(
      this.companyName,
      this.customerName,
      this.invoiceNumber,
      this.date,
      this.address,
      this.contactNumber,
      this.email,
      this.invoiceType,
      this.customerPhoneNumber,
      this.invoiceDetail,
      this.gstNumber,
      this.discount,
      this.sgstPercent,
      this.sgstAmount,
      this.cgstPercent,
      this.cgstAmount,
      this.invoiceTotal,
      this.taxableAmount,
      this.termAndConditionList);
}

class InvoiceDetail {
  String srNumber;
  String description;
  String size;
  String qty;
  String rate;
  String total;

  InvoiceDetail(this.srNumber, this.description, this.size, this.qty, this.rate,
      this.total);
}
