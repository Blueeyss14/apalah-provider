import 'package:apalah/models/human_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemClicked extends StatelessWidget {
  final Human humanData;
  const ItemClicked({
    super.key,
    required this.humanData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: Image.network(humanData.image, fit: BoxFit.cover),
            ),
            Text(humanData.name),
            Text(humanData.description),
            Text(humanData.value.toString()),
          ],
        ));
  }
}
