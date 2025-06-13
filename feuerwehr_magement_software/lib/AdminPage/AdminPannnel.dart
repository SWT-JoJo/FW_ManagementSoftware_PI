import 'package:feuerwehr_magement_software/shared/navigationBar.dart';
import 'package:flutter/material.dart';
import '../shared/Appbar.dart';

class adminPannel extends StatelessWidget {
  const adminPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Center(
            child: Text(
              "Admin Pannel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
          ),

        ]
      ),

      bottomNavigationBar: navBar(),

    );
  }
}
