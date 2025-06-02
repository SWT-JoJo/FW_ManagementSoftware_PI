import 'package:flutter/material.dart';
class LetzterEinsatzCard extends StatelessWidget {
  final String stichwort;
  final String datumUhrzeit;
  final String adresse;
  final String status;
  final Color statusColor;
  final IconData icon;

  const LetzterEinsatzCard({
    super.key,
    required this.stichwort,
    required this.datumUhrzeit,
    required this.adresse,
    required this.status,
    required this.icon,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, size: 50, color: Colors.red[800]),

            // EinsatzInfos
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stichwort,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(datumUhrzeit),
                Text(adresse),
              ],
            ),
            const SizedBox(width: 10),
            Card(
              color: statusColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(status),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UebungsDienstCard extends StatelessWidget {
  final String Thema;
  final String Verwantworlticher;
  final String Datum;
  final String Uhrzeit;


  const UebungsDienstCard(
      {super.key, required this.Thema, required this.Verwantworlticher, required this.Datum, required this.Uhrzeit,});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          //Title
          Text(
            "ABCDEFGHIJKLMNOPQ",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,

            ),
          ),
        ],
      ),
    );
  }
}


class LehrgangsCard extends StatelessWidget {
  const LehrgangsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
