import 'package:apalah/models/human_data.dart';
import 'package:apalah/provider/human_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTotals extends StatefulWidget {
  const MyTotals({super.key});

  @override
  State<MyTotals> createState() => _MyTotalsState();
}

class _MyTotalsState extends State<MyTotals> {
  final List<Human> _totalData = Human.dataHuman();
  int totalData = 0;

  void tambahData() {
    totalData = 0;
    for (int i = 0; i < _totalData.length; i++) {
      totalData += _totalData[i].value;
    }
  }

  @override
  void initState() {
    super.initState();
    tambahData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HumanProvider>(
        builder: (context, humanProvider, child) {
          final currentTotal = humanProvider.totalSavedValue;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Current Total: $currentTotal"),
                Text(
                  "Total: $totalData",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
