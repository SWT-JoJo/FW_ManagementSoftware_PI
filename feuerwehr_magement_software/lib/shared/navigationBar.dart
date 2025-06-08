import 'package:flutter/material.dart';


class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  final int _selectedIndex = getselectedPage();


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
              Navigator.pushNamed(context, '/einsätze');
              break;
            case 1:
              Navigator.pushNamed(context, '/fahrzeuge');
              break;
            case 2:
              Navigator.pushNamed(context, '/home');
              break;
            case 3:
              Navigator.pushNamed(context, '/kalender');
              break;
            case 4:
              Navigator.pushNamed(context, '/mehr');
              break;
          }
        });
      });
  }
}


int _selectedPage = 3;

void setSelectedPage(int index){
  _selectedPage = index;
}

int getselectedPage(){
  return _selectedPage;
}

