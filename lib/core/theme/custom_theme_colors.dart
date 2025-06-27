import 'package:flutter/material.dart';

class CustomThemeColors {
    static Brightness getThemeBrightness(BuildContext context) {
    return Theme.of(context).brightness;
  }

    static bool isDarkMode(BuildContext context) {
    return getThemeBrightness(context) == Brightness.dark;
  }

   static Color bottomNavBarColor(BuildContext context) {
    return isDarkMode(context)
        ? Colors.black
        : Colors.white;
  }

  static Color bottomSelectedItemColor(BuildContext context){
    return isDarkMode(context) 
        ? Colors.white
        : Colors.black;
  }

  static Color homeContainerColor (BuildContext context){
    return isDarkMode(context) 
        ? Color.fromARGB(255, 22, 22, 22)
        : Colors.grey.shade200;
  }

  static Color searchBarContainer (BuildContext context){
    return isDarkMode(context) 
        ? Colors.grey.shade900
        : Colors.grey.shade200;
  }
}