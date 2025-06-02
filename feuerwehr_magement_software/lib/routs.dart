//pageImports
import 'package:feuerwehr_magement_software/Mainpage/MainPage.dart';
import 'LoginPage/loginpage.dart';
import 'MehrPage/mehrPage.dart';
import 'KalenderPage/kalendarPage.dart';
import 'fahrzeugPage/fahrzeugePage.dart';
import 'EinsatzPage/einsatzePage.dart';



//routs Array

var pagerouts = {
  "/login" : (context) => const loginPage(),
  "/einsätze" : (context) => const einsatzePage(),
  "/fahrzeuge" : (context) => const Fahrzeugepage(),
  "/home" : (context) => const MainPage(),
  "/kalender" : (context) => const kalendarPage(),
  "/mehr" : (context) => const mehrPage(),

};


int _selectedPage = 3;

void setSelectedPage(int index){
  _selectedPage = index;
}

int getselectedPage(){
  return _selectedPage;
}