import 'package:feuerwehr_magement_software/shared/Appbar.dart';
import 'package:flutter/material.dart';
import '../shared/navigationBar.dart';
import 'MainPageCards.dart';
import 'dart:async';
import 'package:feuerwehr_magement_software/services/databaseRequestor.dart';
import 'package:feuerwehr_magement_software/shared/TermineCard.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final databaseRequestor _requestor = databaseRequestor();
  Timer? _timer;

  List<LetzterEinsatzCard> letzenEinsaetze = [];
  List<Widget> uebungsdiensteWidgets = [];

  @override
  void initState() {
    super.initState();

    UpdateLetzenEinsaetze();
    UpdateUebungsdienste();

    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      UpdateLetzenEinsaetze();
      UpdateUebungsdienste();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  IconData _getEinsatzIcon(String? kategorie) {
    switch (kategorie?.toLowerCase()) {
      case 'feuer':
        return Icons.local_fire_department;
      case 'thvu':
        return Icons.car_crash;
      case 'th':
        return Icons.build;
      default:
        return Icons.notifications_active;
    }
  }

  void UpdateLetzenEinsaetze() async {
    try {
      final daten = await _requestor.getEinsaetze();

      daten.sort((a, b) => b['enr'].compareTo(a['enr'])); // Absteigend nach Einsatznummer
      final letzte5 = daten.take(5).toList();

      setState(() {
        letzenEinsaetze = letzte5.map((einsatz) {
          final kategorie = einsatz['kategorie'] ?? '';
          final datumUhrzeit = einsatz['alarmzeitpunkt'] ?? '–';
          final adresse = "${einsatz['strasse']}, ${einsatz['plz']} ${einsatz['ort']}";
          final status = einsatz['e_status'] == true ? "laufend" : "beendet";
          final statusColor = einsatz['e_status'] == true ? Colors.redAccent : Colors.greenAccent;

          return LetzterEinsatzCard(
            stichwort: einsatz['stichwort'] ?? '',
            datumUhrzeit: datumUhrzeit,
            adresse: adresse,
            status: status,
            icon: _getEinsatzIcon(kategorie),
            statusColor: statusColor,
          );
        }).toList();
      });
    } catch (e) {
      print("❌ Fehler beim Laden der Einsätze: $e");
    }
  }

  void UpdateUebungsdienste() async {
    try {
      final daten = await _requestor.getUebungsdienste();

      daten.sort((a, b) {
        DateTime dA = DateTime.tryParse(a['start'] ?? '') ?? DateTime(2100);
        DateTime dB = DateTime.tryParse(b['start'] ?? '') ?? DateTime(2100);
        return dA.compareTo(dB);
      });

      final kommende5 = daten.where((eintrag) {
        final start = DateTime.tryParse(eintrag['start'] ?? '');
        if (start == null) return false;
        return start.isAfter(DateTime.now()) || start.isAtSameMomentAs(DateTime.now());
      }).take(5).toList();

      setState(() {
        uebungsdiensteWidgets = kommende5.map((eintrag) {
          final start = DateTime.tryParse(eintrag['start'] ?? '') ?? DateTime(1970);
          final ende = DateTime.tryParse(eintrag['ende'] ?? '') ?? DateTime(1970);

          final uhrStart = TimeOfDay(hour: start.hour, minute: start.minute);
          final uhrEnde = TimeOfDay(hour: ende.hour, minute: ende.minute);
          final datum = "${start.day.toString().padLeft(2, '0')}.${start.month.toString().padLeft(2, '0')}.${start.year}";

          return termineWidget(
            thema: eintrag['thema'] ?? "Unbekannt",
            datum: datum,
            uhrstart: uhrStart,
            uhrende: uhrEnde,
            verantwortlicher: eintrag['verantwortlicher'] ?? "–",
            abteilung: eintrag['abteilung'] ?? "–",
            color: Colors.orangeAccent,
            plz: eintrag['plz']?.toString() ?? "–",
            Ort: eintrag['ort'] ?? "–",
            Strasse: eintrag['strasse'] ?? "–",
          );
        }).toList();
      });
    } catch (e) {
      print("❌ Fehler beim Laden der Übungsdienste: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Letzte Einsätze
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Letzte Einsätze",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ...letzenEinsaetze,
              ],
            ),

            const SizedBox(height: 15),

            // Übungsdienste
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Übungsdienste / Termine",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: uebungsdiensteWidgets.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) => uebungsdiensteWidgets[index],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Lehrgänge (Platzhalter)
           /* Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Lehrgänge",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [],
                ),
              ],
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
