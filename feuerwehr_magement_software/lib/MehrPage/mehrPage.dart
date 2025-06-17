import 'package:feuerwehr_magement_software/services/USERDATA.dart';
import 'package:flutter/material.dart';

import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';
import 'package:feuerwehr_magement_software/AdminPage/AdminPannnel.dart';

class mehrPage extends StatefulWidget {
  const mehrPage({super.key});

  @override
  State<mehrPage> createState() => _mehrPageState();
}

class _mehrPageState extends State<mehrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Text(
              "Mehr",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            if (isAdmin)
              navigationCard(
                icon: Icon(Icons.admin_panel_settings),
                text: "Admin Pannel",
                targetPage: AdminPannel(), // Korrekte Klasse verwenden
              ),
            navigationCard(icon: Icon(Icons.person), text: "Profil Einstellungen"),
            navigationCard(icon: Icon(Icons.settings), text: "App Einstellungen"),
            navigationCard(icon: Icon(Icons.group), text: "Benutzer"),
            navigationCard(icon: Icon(Icons.school), text: "Lehrgänge"),
            navigationCard(icon: Icon(Icons.book), text: " (tba)"),
            navigationCard(icon: Icon(Icons.fire_hydrant_alt_sharp), text: "Hydrantenkarte (tba)"),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}

class navigationCard extends StatelessWidget {
  final Icon icon;
  final String text;
  final Widget? targetPage;

  const navigationCard({
    super.key,
    required this.icon,
    required this.text,
    this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: () {
          if (targetPage != null) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => targetPage!,
                transitionDuration: Duration.zero,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Die Funktion für "$text" ist noch nicht implementiert.')),
            );
          }
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
