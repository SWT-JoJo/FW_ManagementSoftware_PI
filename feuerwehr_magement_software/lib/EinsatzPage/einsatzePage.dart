import 'package:feuerwehr_magement_software/shared/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:feuerwehr_magement_software/Mainpage/MainPageCards.dart';
import '../shared/navigationBar.dart';
import '../services/databaseRequestor.dart';

class EinsatzePage extends StatefulWidget {
  const EinsatzePage({super.key});

  @override
  State<EinsatzePage> createState() => _EinsatzePageState();
}

class _EinsatzePageState extends State<EinsatzePage> {
  List<dynamic> einsaetze = [];

  @override
  void initState() {
    super.initState();
    ladeEinsaetze();
  }

  Future<void> ladeEinsaetze() async {
    final daten = await databaseRequestor().getEinsaetze();
    daten.sort((a, b) => b['enr'].compareTo(a['enr'])); // Absteigend sortieren

    setState(() {
      einsaetze = daten;
    });
  }

  IconData _getEinsatzIcon(String? kategorie) {
    switch (kategorie?.toLowerCase()) {
      case 'feuer':
        return Icons.local_fire_department; // 🔥 Flamme
      case 'thvu':
        return Icons.car_crash; // 🚗 Unfall
      case 'th':
        return Icons.build; // 🔧 Technische Hilfe (Werkzeug)
      default:
        return Icons.notifications_active; // 🔔 Standard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: einsaetze.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: einsaetze.map((einsatz) {
                  final kategorie = einsatz['kategorie'] ?? '';
                  return LetzterEinsatzCard(
                    stichwort: einsatz['stichwort'] ?? '',
                    datumUhrzeit: einsatz['alarmzeitpunkt'], // Optional: Wenn Zeit später kommt
                    adresse:
                    "${einsatz['strasse']}, ${einsatz['plz']} ${einsatz['ort']}",
                    status:
                    einsatz['e_status'] == true ? "laufend" : "beendet",
                    icon: _getEinsatzIcon(kategorie),
                    statusColor: einsatz['e_status'] == true
                        ? Colors.redAccent
                        : Colors.greenAccent,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
