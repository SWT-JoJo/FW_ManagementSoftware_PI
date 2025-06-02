import 'package:flutter/material.dart';

import '../shared/navigationBar.dart';

class Fahrzeugepage extends StatelessWidget {
  const Fahrzeugepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: navBar(),

    );
  }
}
