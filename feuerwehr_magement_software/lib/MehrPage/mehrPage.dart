import 'package:flutter/material.dart';

import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';
import '../AdminPage/AdminPannnel.dart';

class mehrPage extends StatefulWidget {

  static bool isAdmin = true;

  const mehrPage({super.key});

  @override
  State<mehrPage> createState() => _mehrPageState();
}

class _mehrPageState extends State<mehrPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: appAppBar(),

        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 15,),
              Text(
                "Mehr",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
              if(mehrPage.isAdmin)
                navigationCard(icon: Icon(Icons.admin_panel_settings), text: "Admin Pannel", targetPage: adminPannel()),
              navigationCard(icon: Icon(Icons.person), text: "Profil Einstellungen"),
              navigationCard(icon: Icon(Icons.settings), text: "App Einstellungen"),
              navigationCard(icon: Icon(Icons.group), text: "Benutzer"),
              navigationCard(icon: Icon(Icons.school), text: "Lehrgänge"),
              navigationCard(icon: Icon(Icons.book), text: " (tba)"),
              navigationCard(icon: Icon(Icons.fire_hydrant_alt_sharp), text: "Hydrantenkarte (tba)"),
            ],
          ),
        ),


        bottomNavigationBar: navBar());
  }
}


class navigationCard extends StatelessWidget {
  final Icon icon;
  final String text;
  final Widget? targetPage; // Neuer, optionaler Parameter für die Zielseite

  const navigationCard({
    super.key,
    required this.icon,
    required this.text,
    this.targetPage, // Kann null sein, wenn keine Navigation erfolgen soll
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Fügt etwas vertikalen Abstand zwischen den Karten hinzu
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        // Macht die Karte klickbar und bietet visuelles Feedback beim Tippen
        onTap: () {
          if (targetPage != null) {
            // Führt die Navigation zur Zielseite aus, ohne Animation
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => targetPage!,
                transitionDuration: Duration.zero, // Setzt die Übergangsdauer auf Null
              ),
            );
          } else {
            // Optional: Zeigt eine Snackbar an, wenn die Navigation nicht implementiert ist
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Die Funktion für "${text}" ist noch nicht implementiert.')),
            );
          }
        },
        // Rundet die Ecken des InkWell-Effekts ab, passend zur Card
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          // Erhöhtes Padding für bessere Optik und größere Tippfläche
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              // Vergrößerter Abstand zwischen Icon und Text
              const SizedBox(width: 15),
              // Expanded sorgt dafür, dass der Text den verfügbaren Platz einnimmt
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, // Leicht angepasste Schriftgröße
                  ),
                ),
              ),
              // Der Pfeil am Ende wurde gemäß Ihrer Vorlage entfernt
              // const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
