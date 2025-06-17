import 'package:feuerwehr_magement_software/shared/Appbar.dart';
import 'package:feuerwehr_magement_software/shared/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:feuerwehr_magement_software/shared/TermineCard.dart';
import 'package:http/http.dart' as http; // Importiere http-Paket
import 'dart:convert';

import '../services/databaseRequestor.dart'; // Importiere dart:convert für JSON-Dekodierung

// Definiere die URL für deine Backend-API
// Ersetze 'http://your-backend-ip:port' durch die tatsächliche IP-Adresse und den Port deines Spring Boot Backends
const String url = 'http://10.0.2.2:8080'; // Beispiel: 'http://192.168.1.100:8080' für Android-Emulator oder 'http://localhost:8080' für Web/Desktop

class kalendarPage extends StatefulWidget {
  static DateTime selectedDay = DateTime.now();

  const kalendarPage({super.key});

  @override
  State<kalendarPage> createState() => _kalendarPageState();
}

class _kalendarPageState extends State<kalendarPage> {
  // Liste zur Speicherung der geladenen Termine
  List<dynamic> _uebungsdienste = [];
  // Ladezustand für die Datenabfrage
  bool _isLoading = true;
  // Fehlermeldung bei Problemen
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Beim Initialisieren der Seite die Daten für den aktuell ausgewählten Tag laden
    _fetchUebungsdiensteForSelectedDay();
  }

  // Methode zum Laden der Übungsdienste für den ausgewählten Tag
  Future<void> _fetchUebungsdiensteForSelectedDay() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _uebungsdienste = [];
    });

    try {
      final data = await databaseRequestor().getUebungsdiensteAm(kalendarPage.selectedDay);
      setState(() {
        _uebungsdienste = data;
        _isLoading = false;
      });
    } catch (e) {
      print("Fehler beim Laden der Übungsdienste: $e");
      setState(() {
        _errorMessage = "Termine konnten nicht geladen werden: ${e.toString()}";
        _isLoading = false;
      });
    }
  }


  // Deine bestehende Methode zum Abrufen der Übungsdienste von der API
  Future<List<dynamic>> getUebungsdiensteAm(DateTime date) async {
    // Formatiere das Datum in das im Backend erwartete Format (Tag-Monat-Jahr)
    final urlToUse = '$url/UebungsdiensteAm/${date.day}-${date.month}-${date.year}';
    print('⚠️ Request an: $urlToUse');
    final response = await http.get(Uri.parse(urlToUse));

    print("🔁 Statuscode: ${response.statusCode}");
    print("📦 Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        final decoded = json.decode(response.body);
        print("✅ JSON-Decode erfolgreich: $decoded");

        if (decoded is List) {
          return decoded;
        } else {
          throw Exception("❌ JSON ist kein List-Objekt: $decoded");
        }
      } catch (e) {
        print("❌ Fehler beim JSON-Dekodieren: $e");
        throw Exception("Fehler beim Verarbeiten der Übungsdienst-Daten");
      }
    } else {
      throw Exception("❌ Fehler beim Laden der Übungsdienste – Status: ${response.statusCode}");
    }
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      kalendarPage.selectedDay = day;
      // Wenn der Tag geändert wird, lade die Termine für den neuen Tag neu
      _fetchUebungsdiensteForSelectedDay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Center(
              child: Text(
                "Dienstplan",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
            ),
            TableCalendar(
              locale: 'en_US',
              rowHeight: 50,
              focusedDay: kalendarPage.selectedDay,
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2050, 12, 31),
              selectedDayPredicate: (day) =>
                  isSameDay(day, kalendarPage.selectedDay),
              onDaySelected: onDaySelected,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.red[200],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: 320, // Eine feste Höhe für den Terminbereich
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      "Termine am ${kalendarPage.selectedDay.day}.${kalendarPage.selectedDay.month}.${kalendarPage.selectedDay.year}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: _isLoading // Zeige Ladekreis, wenn Daten geladen werden
                          ? Center(child: CircularProgressIndicator())
                          : _errorMessage != null // Zeige Fehlermeldung, wenn ein Fehler auftrat
                          ? Center(
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      )
                          : _uebungsdienste.isEmpty // Zeige Nachricht, wenn keine Termine gefunden wurden
                          ? Center(
                        child: Text(
                          "Keine Termine für diesen Tag.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _uebungsdienste.length,
                        itemBuilder: (context, index) {
                          final termin = _uebungsdienste[index];

                          // Datum und Uhrzeit parsen
                          DateTime startTime = DateTime.parse(termin['start']);
                          DateTime endTime = DateTime.parse(termin['ende']);

                          // TODO: Abteilungs- und Verantwortlichen-Namen aus IDs abrufen, falls nötig.
                          // Derzeit werden Platzhalter verwendet, da die JSON nur IDs liefert.
                          String? abteilungName; // Du müsstest hier eine Logik hinzufügen, um Abteilungsnamen anhand der ID zu bekommen
                          String? verantwortlicherName; // Auch hier bräuchtest du eine Logik für den Verantwortlichen

                          return termineWidget(
                            thema: termin['thema'] ?? 'Kein Thema',
                            datum: "${startTime.day}.${startTime.month}.${startTime.year}",
                            uhrstart: TimeOfDay.fromDateTime(startTime),
                            uhrende: TimeOfDay.fromDateTime(endTime),
                            verantwortlicher: verantwortlicherName ?? 'ID: ${termin['verantwortlich']}', // Zeige ID, da Name fehlt
                            abteilung: abteilungName ?? 'Unbekannte Abteilung', // Platzhalter
                            color: Colors.blueAccent, // Du könntest die Farbe basierend auf dem Typ des Termins anpassen
                            plz: termin['plz']?.toString() ?? 'N/A',
                            Ort: termin['ort'] ?? 'N/A',
                            Strasse: termin['strasse'] ?? 'N/A',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}