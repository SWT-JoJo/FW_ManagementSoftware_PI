import 'package:flutter/material.dart';
import 'package:feuerwehr_magement_software/routs.dart';


class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _selectedIndex = getselectedPage();


  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: "Einsätze",),
      BottomNavigationBarItem(icon: Icon(Icons.fire_truck_rounded), label: "Fahrzeuge"),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Dienstplan"),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Mehr"),
    ],
    unselectedItemColor: Colors.black, selectedItemColor: Colors.red[800],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          setSelectedPage(index);

          switch(index){
            case 0:
              Navigator.pushReplacementNamed(context, '/einsätze');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/fahrzeuge');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/kalender');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/mehr');
              break;
          }
        });
      });
  }
}


