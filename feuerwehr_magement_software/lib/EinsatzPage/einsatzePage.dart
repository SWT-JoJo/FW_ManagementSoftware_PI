import 'package:feuerwehr_magement_software/shared/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:feuerwehr_magement_software/Mainpage/MainPageCards.dart';

import '../shared/navigationBar.dart';

class einsatzePage extends StatelessWidget {
  const einsatzePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                "Einsätze",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
            ),
        
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LetzterEinsatzCard(stichwort: "F2-Y Menschenleben", datumUhrzeit: "19:30", adresse: "Hasenstraße 4", status: "laufend", icon: Icons.local_fire_department, statusColor: Colors.redAccent),
                  LetzterEinsatzCard(stichwort: "F1 innerorts", datumUhrzeit: "19:30", adresse: "Hasenstraße 4", status: "beendet", icon: Icons.local_fire_department, statusColor: Colors.greenAccent),
                  LetzterEinsatzCard(stichwort: "F2-Y Menschenleben", datumUhrzeit: "19:30", adresse: "Hasenstraße 4", status: "laufend", icon: Icons.local_fire_department, statusColor: Colors.redAccent),
                  LetzterEinsatzCard(stichwort: "F1 innerorts", datumUhrzeit: "19:30", adresse: "Hasenstraße 4", status: "beendet", icon: Icons.local_fire_department, statusColor: Colors.greenAccent),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: navBar(),
    );
  }



}





