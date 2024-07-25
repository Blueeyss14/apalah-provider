import 'package:apalah/provider/human_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySave extends StatelessWidget {
  const MySave({super.key});

  @override
  Widget build(BuildContext context) {
    final humanProvider = Provider.of<HumanProvider>(context);
    final humans = humanProvider.humans;
    final savedHumans = humans.where((human) => human.check).toList();
    savedHumans.sort((a, b) => a.name.compareTo(b.name));

    return Scaffold(
      body: savedHumans.isEmpty
          ? const Center(child: Text("No Data"))
          : ListView.builder(
              itemCount: savedHumans.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(savedHumans[index].image),
                  ),
                  title: Text(savedHumans[index].name),
                  subtitle: Text(savedHumans[index].description),
                  trailing: Text("${savedHumans[index].value}"),
                );
              },
            ),
    );
  }
}
