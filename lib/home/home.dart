import 'package:apalah/pages/list_item.dart';
import 'package:apalah/pages/save_item.dart';
import 'package:apalah/pages/total_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  int botNavBarIndex = 0;
  final List<Widget> pages = const [
    MyItem(),
    MySave(),
    MyTotals(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 27,
        ),
        title: const Text(
          "APALAH",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: (value) {
          setState(() {
            botNavBarIndex = value;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: botNavBarIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Iconsax.save_2), label: "Save"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.quant_qnt), label: "Totals"),
        ],
        onTap: (value) {
          setState(() {
            botNavBarIndex = value;
            pageController.animateToPage(botNavBarIndex,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linearToEaseOut);
          });
        },
      ),
    );
  }
}
