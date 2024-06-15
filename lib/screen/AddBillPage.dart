
import 'package:flutter/material.dart';

class AddBillPage extends StatefulWidget {
  const AddBillPage({super.key});

  @override
  State<AddBillPage> createState() => _AddBillPage();
}

class _AddBillPage extends State<AddBillPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Generator"),),
      body: SafeArea(child:
      Column(
        children: [
        ],
      )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },
      ),
    );
  }
}