import 'package:feuerwehr_magement_software/shared/Appbar.dart';
import 'package:flutter/material.dart';
import '../shared/navigationBar.dart';
import 'MainPageCards.dart';
import 'dart:async';
import 'package:feuerwehr_magement_software/shared/TermineCard.dart';
// Pfad zum DatabaseHelper

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Instanz des DatabaseHelper erstellen
  //final DatabaseHelper _dbHelper = DatabaseHelper(); // <--- HIER INSTANZIERT

  List<LetzterEinsatzCard> letzenEinsaetze = [
    LetzterEinsatzCard(
      icon: Icons.downloading,
      stichwort: "Lädt...",
      datumUhrzeit: "-",
      adresse: "-",
      status: "Wird geladen",
      statusColor: Colors.grey,
    ),
    LetzterEinsatzCard(
      icon: Icons.downloading,
      stichwort: "Lädt...",
      datumUhrzeit: "-",
      adresse: "-",
      status: "Wird geladen",
      statusColor: Colors.grey,
    ),
  ];

  List<LehrgangsCard> Lehrgaenge = [];

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Last Einsätze
            Column(
              children: [
                Text(
                  "  Letzen Einsätze",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                letzenEinsaetze[0],
                letzenEinsaetze[1],
              ],
            ),

            const SizedBox(height: 15),

            //Übungsdienste
            Column(
              children: [
                Text(
                  "Übungsdienste / Termine",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // **Wichtig: Expanded durch SizedBox mit fester Höhe ersetzen**
                  child: SizedBox(
                    height: 270, // Beispielhöhe: Die Höhe der TerminCard (200) + etwas Padding
                    child: ListView.builder(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {

                      return termineWidget(
                        thema: "Erste Hilfe + Fwdv3 + WettkampfMittwoch",
                        datum: "24.05.2024",
                        uhrstart: TimeOfDay(hour: 18, minute: 00),
                        uhrende: TimeOfDay(hour: 20, minute: 00),
                        verantwortlicher: "Max Musterman",
                        abteilung: "Jugenfeuerwehr",
                        color: Colors.orangeAccent,
                        plz: "65343",
                        Ort: "Schierstein",
                        Strasse: "Musterstraßeße 5",
                      );
                    }
                    )
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            Column(
              // Expanded kann hier nicht direkt verwendet werden
              children: [
                Text(
                  "Lehrgänge",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // GridView.count ist in einer Column ohne Expanded oder fester Höhe ok,
                // solange shrinkWrap: true und NeverScrollableScrollPhysics gesetzt sind.
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [],
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: navBar(),
    );
  }

  @override
  void initState() {
    super.initState();

    // Startet den Timer für regelmäßige Updates
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      UpdateLetzenEinsaetze();
      UpdateLehrgaenge();
      //UpdateUebungsdienste();
    });

    // Erster Aufruf der Update-Funktionen und der Datenbankabfrage direkt beim Start
    // Da diese Funktionen asynchron sind, müssen Sie sie nicht "await"en,
    // es sei denn, Sie wollen sicherstellen, dass sie VOR dem Bau des Widgets abgeschlossen sind,
    // was hier aber nicht kritisch ist, da Sie Platzhalter-Daten haben.
    UpdateLetzenEinsaetze();
    UpdateLehrgaenge();
    //UpdateUebungsdienste();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Update Funktionen (Bleiben wie sie sind, können später Daten aus DB holen)
  void UpdateLetzenEinsaetze() {
    setState(() {
      letzenEinsaetze[0] = LetzterEinsatzCard(
        icon: Icons.local_fire_department,
        stichwort: "BMA Einlauf",
        datumUhrzeit: "27.01.2024",
        adresse: "Musterstraße 4",
        status: "laufend",
        statusColor: Colors.redAccent,
      );

      letzenEinsaetze[1] = LetzterEinsatzCard(
        icon: Icons.car_crash,
        stichwort: "H2Y - Klemm ",
        datumUhrzeit: "23.01.2024",
        adresse: "Musterstraße 4",
        status: "Beendet",
        statusColor: Colors.greenAccent,
      );
    });
  }

  void UpdateLehrgaenge() {
    setState(() {
      // Hier würden Sie später Daten aus der DB holen und Ihre Lehrgaenge-Liste aktualisieren
      // Lehrgaenge.clear(); // Falls Sie die alten Daten entfernen möchten
      // Lehrgaenge.add(LehrgangsCard(...));
    });
  }
}
