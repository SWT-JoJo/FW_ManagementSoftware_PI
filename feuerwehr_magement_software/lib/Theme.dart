
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  //Appbar Desing
  appBarTheme: AppBarTheme(
      elevation: 6,
      shadowColor: Colors.black,

      backgroundColor: Colors.red[800],
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),

  ),
  cardTheme: CardTheme(
    elevation: 3,
  ),


  navigationBarTheme: NavigationBarThemeData(
    elevation: 2,
    backgroundColor: Colors.white70,
  ),

  //Scaffold desing (allgemeines Desing)
  scaffoldBackgroundColor: Colors.white,



);