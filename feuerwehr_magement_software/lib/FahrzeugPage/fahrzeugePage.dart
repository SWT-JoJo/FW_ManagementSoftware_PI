import 'package:flutter/material.dart';

import '../shared/Appbar.dart';
import '../shared/navigationBar.dart';

class Fahrzeugepage extends StatelessWidget {
  const Fahrzeugepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              fahrzeugCard(statusColor: Colors.green, statusInt: 1, funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.lightGreen, statusInt: 2,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.yellow, statusInt: 3,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.red, statusInt: 4,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.black, statusInt: 6,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.green, statusInt: 1, funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.lightGreen, statusInt: 2,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.yellow, statusInt: 3,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.red, statusInt: 4,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.black, statusInt: 6,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.green, statusInt: 1, funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.lightGreen, statusInt: 2,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.yellow, statusInt: 3,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.red, statusInt: 4,funkName: "1-46-2", typ: "LF20"),
              fahrzeugCard(statusColor: Colors.black, statusInt: 6,funkName: "1-46-2", typ: "LF20"),
            ],
          ),
        ),
      ),

      bottomNavigationBar: navBar(),
    );
  }
}

class fahrzeugCard extends StatefulWidget {
  final Color statusColor;
  final int statusInt;
  final String funkName;
  final String typ;


  const fahrzeugCard({
    super.key,
    required this.statusColor,
    required this.statusInt,
    required this.funkName,
    required this.typ,
  });

  @override
  State<fahrzeugCard> createState() => _fahrzeugCardState();
}

class _fahrzeugCardState extends State<fahrzeugCard> {

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
              ClipRRect( // Wrap ColoredBox with ClipRRect
                borderRadius: BorderRadius.circular(10.0), // Adjust radius as needed
                child: ColoredBox(
                  color: widget.statusColor,
                  child: const SizedBox(width: 75, height: 75),
                ),
              ),
              Text(
                widget.statusInt.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),

          const SizedBox(width: 10),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.funkName,
                style: TextStyle(
                  fontWeight:  FontWeight.bold,
                  fontSize: 20
                ),
              ),

              Text(widget.typ,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            ],
          ),
          //SizedBox(width: 60,),
          //Text("Im Dienst seit\n 2024", textAlign: TextAlign.center, ),

        ],
      ),
    );
  }
}
