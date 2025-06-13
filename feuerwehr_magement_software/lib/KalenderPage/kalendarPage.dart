import 'package:feuerwehr_magement_software/shared/Appbar.dart';
import 'package:feuerwehr_magement_software/shared/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:feuerwehr_magement_software/shared/TermineCard.dart';

class kalendarPage extends StatefulWidget {
  //final  DateTime today = DateTime.now();
  static DateTime selectedDay = DateTime.now();

  const kalendarPage({super.key});

  @override
  State<kalendarPage> createState() => _kalendarPageState();
}

class _kalendarPageState extends State<kalendarPage> {
  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      kalendarPage.selectedDay = day;
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
              selectedDayPredicate:
                  (day) => isSameDay(day, kalendarPage.selectedDay),
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
              height: 320,
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
                      child:  ListView(
                        padding: const EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        children: [
                          termineWidget(
                              thema: "Fwdv3",
                              datum: "24.05.2024",
                              uhrstart: TimeOfDay(hour: 18, minute: 00),
                              uhrende: TimeOfDay(hour: 20, minute: 00),
                              verantwortlicher: "Max Musterman",
                              abteilung: "Jugenfeuerwehr",
                              color: Colors.orangeAccent,
                              plz: "65343",
                              Ort: "Schierstein",
                              Strasse: "Musterstraßeße 5",
                          )
                        ],
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


