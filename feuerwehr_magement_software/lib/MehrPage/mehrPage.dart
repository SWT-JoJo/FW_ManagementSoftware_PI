import 'package:flutter/material.dart';

import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';

class mehrPage extends StatelessWidget {
  const mehrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: appAppBar(),

      bottomNavigationBar: navBar(),
    );
  }
}
