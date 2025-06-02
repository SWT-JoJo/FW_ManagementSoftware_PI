//pageImports
import 'package:feuerwehr_magement_software/Mainpage/MainPage.dart';
import '../LoginPage/loginpage.dart';
import '../MehrPage/mehrPage.dart';
import '../KalenderPage/kalendarPage.dart';
import '../fahrzeugPage/fahrzeugePage.dart';
import '../EinsatzPage/einsatzePage.dart';



//routs Array

var pagerouts = {
  "login" : (context) => const loginPage(),
  "einsatze" : (context) => const einsatzePage(),
  "fahrzeuge" : (context) => const Fahrzeugepage(),
  "mainpage" : (context) => const MainPage(),
  "kalender" : (context) => const kalendarPage(),
  "mehr" : (context) => const mehrPage(),

};