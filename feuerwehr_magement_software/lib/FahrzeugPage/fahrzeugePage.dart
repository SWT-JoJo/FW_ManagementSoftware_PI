import 'package:flutter/material.dart';

import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';

class Fahrzeugepage extends StatelessWidget {
  // Die Liste der Fahrzeugdaten ist hier definiert.
  static const List<Map<String, dynamic>> fwFahrzeugCardDemo = [
    {
      'status': 1,
      'funkname': 'Florian Eltville 1/46-1',
      'bezeichnung': 'LF 20'
    },
    {
      'status': 2,
      'funkname': 'Florian Eltville 1/19-1',
      'bezeichnung': 'ELW 1'
    },
    {
      'status': 3,
      'funkname': 'Florian Eltville 1/23-1',
      'bezeichnung': 'TLF 16/25'
    },
    {
      'status': 4,
      'funkname': 'Florian Eltville 1/59-1',
      'bezeichnung': 'RW 1'
    },
    {
      'status': 6,
      'funkname': 'Florian Eltville 1/10-1',
      'bezeichnung': 'MTF'
    },
    {
      'status': 1,
      'funkname': 'Florian Kiedrich 1/46-1',
      'bezeichnung': 'LF 10'
    },
    {
      'status': 2,
      'funkname': 'Florian Erbach 1/44-1',
      'bezeichnung': 'HLF 20'
    },
    {
      'status': 3,
      'funkname': 'Florian Hattenheim 1/65-1',
      'bezeichnung': 'GW-L2'
    },
    {
      'status': 4,
      'funkname': 'Florian Martinsthal 1/17-1',
      'bezeichnung': 'TSF-W'
    },
    {
      'status': 6,
      'funkname': 'Florian Rauenthal 1/11-1',
      'bezeichnung': 'MLF'
    },
  ];

  const Fahrzeugepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),

      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        // Set itemCount to the length of your data list
        itemCount: fwFahrzeugCardDemo.length,
        itemBuilder: (BuildContext context, int index) {
          // Get the current vehicle's data map
          final Map<String, dynamic> fahrzeugData = fwFahrzeugCardDemo[index];

          // Pass the specific data points to fahrzeugCard
          return fahrzeugCard(
            // Access values from the map using their keys
            statusInt: fahrzeugData['status'] as int,
            funkName: fahrzeugData['funkname'] as String,
            typ: fahrzeugData['bezeichnung'] as String,
          );
        },
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
    2: Colors.lightGreen,
    3: Colors.yellow,
    4: Colors.red,
    6: Colors.black,
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
        spacing: 10,
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

          const SizedBox(width: 10),

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

