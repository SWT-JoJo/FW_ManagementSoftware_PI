import 'package:feuerwehr_magement_software/LoginPage/loginpage.dart';
import 'package:feuerwehr_magement_software/Theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,


      home: loginPage(),
    );
  }
}
