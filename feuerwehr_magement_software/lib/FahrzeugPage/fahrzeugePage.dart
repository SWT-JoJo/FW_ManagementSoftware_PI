import 'package:flutter/material.dart';
import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';
import '../services/databaseRequestor.dart'; // Datei importieren

class Fahrzeugepage extends StatefulWidget {
  const Fahrzeugepage({super.key});

  @override
  State<Fahrzeugepage> createState() => _FahrzeugepageState();
}

class _FahrzeugepageState extends State<Fahrzeugepage> {
  List<dynamic> fahrzeuge = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFahrzeuge();
  }

  Future<void> loadFahrzeuge() async {
    try {
      final data = await databaseRequestor().getFahrzeuge();
      setState(() {
        fahrzeuge = data;
        isLoading = false;
      });
    } catch (e) {
      print('Fehler beim Laden der Fahrzeugdaten: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          const SizedBox(height: 15),
          Center(
            child: Text(
              "Fahrzeuge",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: fahrzeuge.length,
              itemBuilder: (context, index) {
                final fahrzeug = fahrzeuge[index];
                return fahrzeugCard(
                  statusInt: fahrzeug['status'],
                  funkName: fahrzeug['funkbez'],
                  typ: fahrzeug['bezeichnung'],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: navBar(),
    );
  }
}



//Cards Templates

class fahrzeugCard extends StatelessWidget {
  final int statusInt;
  final String funkName;
  final String typ;

  static const Map<int, Color> statusColors = {
    1: Colors.green,
    2: Colors.lightGreenAccent,
    3: Colors.yellow,
    4: Colors.red,
    5: Colors.lightBlueAccent,
    6: Colors.black,
    0: Colors.blue,
  };



  const fahrzeugCard({
    super.key,
    required this.statusInt,
    required this.funkName,
    required this.typ,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // Die 'spacing' Eigenschaft ist in einer Row oder Column nicht vorhanden.
        // Sie wird in Widgets wie Wrap oder Chips verwendet.
        // Wenn du Abstand zwischen den Elementen in der Row brauchst,
        // verwende stattdessen SizedBox oder Padding.
        // Ich habe 'spacing' hier entfernt, um einen Fehler zu vermeiden.
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                // Wrap ColoredBox with ClipRRect
                borderRadius: BorderRadius.circular(10.0),
                // Adjust radius as needed
                child: ColoredBox(
                  color: statusColors[statusInt] ?? Colors.grey, // Use default color (grey) if not found
                  child: const SizedBox(width: 75, height: 75),
                ),
              ),
              Text(
                statusInt.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(width: 10), // Abstand hinzugefügt

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                funkName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              Text(typ, style: TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}