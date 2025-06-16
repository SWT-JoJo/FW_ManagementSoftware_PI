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

    // Erstes Laden
    UpdateLetzenEinsaetze();
    UpdateUebungsdienste();

    // Alle 30 Sekunden neu laden
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

  void UpdateLetzenEinsaetze() async {
    try {
      final daten = await _requestor.getEinsaetze();

      daten.sort((a, b) =>
      DateTime.tryParse(b['datum'] ?? '')?.compareTo(DateTime.tryParse(a['datum'] ?? '') ?? DateTime(1970)) ?? 0);

      final letzte5 = daten.take(5).toList();

      setState(() {
        letzenEinsaetze = letzte5.map((eintrag) {
          final datum = DateTime.tryParse(eintrag['datum'] ?? '') ?? DateTime(1970);
          final formatiert =
              "${datum.day.toString().padLeft(2, '0')}.${datum.month.toString().padLeft(2, '0')}.${datum.year} ${datum.hour.toString().padLeft(2, '0')}:${datum.minute.toString().padLeft(2, '0')}";

          Color farbe;
          switch ((eintrag['status'] as String?)?.toLowerCase()) {
            case 'laufend':
              farbe = Colors.redAccent;
              break;
            case 'beendet':
              farbe = Colors.green;
              break;
            default:
              farbe = Colors.grey;
          }

          return LetzterEinsatzCard(
            icon: Icons.fire_truck,
            stichwort: eintrag['stichwort'] ?? "Unbekannt",
            datumUhrzeit: formatiert,
            adresse: eintrag['adresse'] ?? "–",
            status: eintrag['status'] ?? "unbekannt",
            statusColor: farbe,
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

      // Sortiere nach Startzeit (aufsteigend)
      daten.sort((a, b) {
        DateTime dA = DateTime.tryParse(a['start'] ?? '') ?? DateTime(2100);
        DateTime dB = DateTime.tryParse(b['start'] ?? '') ?? DateTime(2100);
        return dA.compareTo(dB);
      });

      // Filtere nur zukünftige Termine (start >= jetzt) und nehme max. 5
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

            // Einsätze
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                ...letzenEinsaetze,
              ],
            ),

            const SizedBox(height: 15),

            // Übungsdienste / Termine
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
            Column(
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
