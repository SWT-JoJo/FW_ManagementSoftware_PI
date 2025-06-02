import 'package:feuerwehr_magement_software/shared/navigationBar.dart';
import 'package:flutter/material.dart';

class kalendarPage extends StatelessWidget {
  const kalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: const Text("Kalender"),) ,





      bottomNavigationBar: navBar(),
    );
  }
}
