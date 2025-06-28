// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    cardColor: Colors.black12,
    appBarTheme: AppBarTheme(
      color: Colors.transparent
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xffDFDFE7)
    ),
    buttonTheme: ButtonThemeData(buttonColor: const Color.fromARGB(255, 128, 107, 99)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
      backgroundColor: Colors.white
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff2f39ac)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      hintStyle: TextStyle(color:Colors.grey),
      fillColor: Color.fromARGB(255, 234, 234, 241),
      outlineBorder: BorderSide(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(13))
      )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Urbanist'),
      bodyMedium: TextStyle(fontFamily: 'Urbanist',color: Colors.black.withOpacity(0.7)),
      bodySmall: TextStyle(fontFamily: 'Urbanist'),
      headlineLarge: TextStyle(fontFamily: 'Urbanist'),
      headlineMedium: TextStyle(fontFamily: 'Urbanist'),
      headlineSmall: TextStyle(fontFamily: 'Urbanist'),
      displayLarge: TextStyle(fontFamily: 'Urbanist'),
      displayMedium: TextStyle(fontFamily: 'Urbanist'),
      displaySmall: TextStyle(fontFamily: 'Urbanist'),
      labelLarge: TextStyle(fontFamily: 'Urbanist', color: Colors.white),
      labelMedium: TextStyle(fontFamily: 'Urbanist'),
      labelSmall: TextStyle(fontFamily: 'Urbanist'),
      titleLarge: TextStyle(fontFamily: 'Urbanist', fontSize: 18),
      titleMedium: TextStyle(fontFamily: 'Urbanist'),
      titleSmall: TextStyle(fontFamily: 'Urbanist',),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xffF0F0F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      )
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.white12,
    appBarTheme: AppBarTheme(
      color: Colors.transparent
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xff3E4056)
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.brown),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      backgroundColor: Colors.black12
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff2f39ac)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      hintStyle: TextStyle(color: Colors.grey),
      fillColor: Color(0xff3B445A),
      outlineBorder: BorderSide(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(13))
      )),
      textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Urbanist'),
      bodyMedium: TextStyle(fontFamily: 'Urbanist', color: Colors.white.withOpacity(0.7)),
      bodySmall: TextStyle(fontFamily: 'Urbanist'),
      headlineLarge: TextStyle(fontFamily: 'Urbanist'),
      headlineMedium: TextStyle(fontFamily: 'Urbanist'),
      headlineSmall: TextStyle(fontFamily: 'Urbanist'),
      displayLarge: TextStyle(fontFamily: 'Urbanist'),
      displayMedium: TextStyle(fontFamily: 'Urbanist'),
      displaySmall: TextStyle(fontFamily: 'Urbanist'),
      labelLarge: TextStyle(fontFamily: 'Urbanist', color: Colors.white),
      labelMedium: TextStyle(fontFamily: 'Urbanist'),
      labelSmall: TextStyle(fontFamily: 'Urbanist'),
      titleLarge: TextStyle(fontFamily: 'Urbanist', fontSize: 18),
      titleMedium: TextStyle(fontFamily: 'Urbanist'),
      titleSmall: TextStyle(fontFamily: 'Urbanist',),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xff090909),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      )
    ),
    
  );
}


//  static const lightMode = Color(0xffDFDFE7);
// static const darkMode = Color(0xff1D1F36);