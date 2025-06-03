import 'package:feuerwehr_magement_software/LoginPage/loginpage.dart';
import 'package:feuerwehr_magement_software/Mainpage/MainPage.dart';
import 'package:feuerwehr_magement_software/Theme.dart';
import 'package:flutter/material.dart';

// *******************************************************************
// WICHTIG: Importieren Sie hier alle Ihre Seiten-Widgets, die über Routen erreichbar sein sollen.
// Diese Pfade müssen zu Ihren tatsächlichen Dateien passen.
import '/EinsatzPage/einsatzePage.dart';
import '/fahrzeugPage/fahrzeugePage.dart';
import '/KalenderPage/kalendarPage.dart';
import '/MehrPage/mehrPage.dart';
// *******************************************************************

void main(){
  runApp(const MyApp()); // const hinzugefügt, da MyApp ein StatelessWidget ist
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Funktion zum Erstellen eines PageRouteBuilder für sofortiges Erscheinen
  PageRouteBuilder _createInstantRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      // Setzt die Übergangsdauer auf Null, um keine Animation zu haben
      transitionDuration: Duration.zero,
      // Gibt das Kind-Widget direkt zurück, ohne Animation
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const loginPage(), // Ihre Startseite

      // Definieren der Routen und ihrer Übergänge
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/einsätze':
            return _createInstantRoute(const einsatzePage());
          case '/fahrzeuge':
            return _createInstantRoute(const Fahrzeugepage());
          case '/home':
            return _createInstantRoute(const MainPage()); // Ihre MainPage ist die Home-Seite
          case '/kalender':
            return _createInstantRoute(const kalendarPage());
          case '/mehr':
            return _createInstantRoute(const mehrPage());
        // Fügen Sie hier weitere Routen hinzu, falls nötig
          default:
          // Optional: Eine Standard-Fallback-Route, falls eine unbekannte Route aufgerufen wird
            return MaterialPageRoute(builder: (context) => const Text('Fehler: Seite nicht gefunden'));
        }
      },
    );

  }
}
