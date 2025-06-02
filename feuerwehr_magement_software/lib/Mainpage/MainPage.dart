import 'package:flutter/material.dart';
import '../shared/navigationBar.dart';
import 'MainPageCards.dart';
import 'dart:async';
import 'package:feuerwehr_magement_software/services/databaseRequestor.dart'; // Pfad zum DatabaseHelper

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

  List<UebungsDienstCard> Uebungsdienste = [
    UebungsDienstCard(
      Thema: "Lädt...",
      Datum: "-",
      Uhrzeit: "-",
      Verwantworlticher: "Bitte warten",
    ),
    UebungsDienstCard(
      Thema: "Lädt...",
      Datum: "-",
      Uhrzeit: "-",
      Verwantworlticher: "Bitte warten",
    ),
  ];

  List<LehrgangsCard> Lehrgaenge = [];

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Freiwillige Feuerwehr \nEltville am Rhein",
          textAlign: TextAlign.center,
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Last Einsätze
            Card(
              child: Column(
                children: [
                  Text(
                    "  Letzen Einsätze",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold),
                  ),
                  letzenEinsaetze[0],
                  letzenEinsaetze[1],
                ],
              ),
            ),

            const SizedBox(height: 15),

            //Übungsdienste
            Card(
              child: Column( // Expanded kann hier nicht direkt verwendet werden, da es in einer Column ist
                children: [
                  Text(
                    "Übungsdienste / Termine",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Uebungsdienste[0],
                      Uebungsdienste[1],
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Lehrgänge
            Card(
              child: Column( // Expanded kann hier nicht direkt verwendet werden
                children: [
                  Text(
                    "Lehrgänge",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Uebungsdienste[0], // Sie haben hier Uebungsdienste statt Lehrgaenge verwendet
                      Uebungsdienste[1], // Hier sollten LehrgangsCards stehen
                    ],
                  )
                ],
              ),
            )
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
      UpdateUebungsdienste();
    });

    // Erster Aufruf der Update-Funktionen und der Datenbankabfrage direkt beim Start
    // Da diese Funktionen asynchron sind, müssen Sie sie nicht "await"en,
    // es sei denn, Sie wollen sicherstellen, dass sie VOR dem Bau des Widgets abgeschlossen sind,
    // was hier aber nicht kritisch ist, da Sie Platzhalter-Daten haben.
    UpdateLetzenEinsaetze();
    UpdateLehrgaenge();
    UpdateUebungsdienste();
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
          statusColor: Colors.redAccent);

      letzenEinsaetze[1] = LetzterEinsatzCard(
          icon: Icons.car_crash,
          stichwort: "H2Y - Klemm ",
          datumUhrzeit: "23.01.2024",
          adresse: "Musterstraße 4",
          status: "Beendet",
          statusColor: Colors.greenAccent);
    });
  }

  void UpdateUebungsdienste() {
    setState(() {
      Uebungsdienste[0] = UebungsDienstCard(
        Thema: "Atemschutz-Übung",
        Datum: "15.06.2024",
        Uhrzeit: "18:00 - 20:30",
        Verwantworlticher: "Anna Schmitt",
      );
      Uebungsdienste[1] = UebungsDienstCard(
        Thema: "TH VU - Verkehrsunfall-Übung",
        Datum: "01.07.2024",
        Uhrzeit: "19:00 - 21:00",
        Verwantworlticher: "Lukas Becker",
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