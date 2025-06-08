import 'package:flutter/material.dart';

import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';

class Fahrzeugepage extends StatelessWidget {
  const Fahrzeugepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),

      bottomNavigationBar: navBar(),

    );
  }
}




//FahrzeugCard

class fahrzeugCard extends StatelessWidget {
  static const Color statusColor = Colors.red;
  static const int status = 1;
  const fahrzeugCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ColoredBox(color: statusColor, child: Text(status.toString()),)
        ],
      ),
    );
  }
}
