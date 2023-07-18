import 'package:flutter/material.dart';

class AppTheme {
  //Color primario global.
  static const Color primary = Colors.deepPurple;
  static const Color iconColor = Colors.black;

  //LIGHT THEME
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Color primario del tema
    primaryColor: Colors.deepPurple,

    //AppBar theme:
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    //Icons theme:
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),

    //TexxButton theme:
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary)
    ),

    //FloatingActionButton theme:
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 2.5,
    ),

    //ElevatedButton theme:
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder(),
        elevation: 0,
      )
    ),

    //BottomNavigationBar theme:
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primary,
    ),

    //InputDecoration theme:
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  ); 





  //DARK THEME
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Color primario
    primaryColor: Colors.indigo,

    //AppBar theme:
    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      elevation: 0,
    ),

    //Icons theme
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    //Scaffold theme:
    //scaffoldBackgroundColor: Colors.blueAccent,
  ); 
}