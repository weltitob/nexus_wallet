import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '/constants.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: ConstantPrimaryColor,
    primaryColorLight: Colors.grey[300],
    primaryColorDark: Colors.grey[800],
    scaffoldBackgroundColor: ConstantColorDarkTheme,
    textTheme: ThemeData.dark().textTheme.copyWith(
      headline1: TextStyle(
        color: Colors.black.withOpacity(0.85),
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.black.withOpacity(0.85),
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    ),
    iconTheme: IconThemeData(color: ConstantContentColorLightTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: ConstantPrimaryColor,
      secondary: ConstantSecondaryColor,
      error: ConstantErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ConstantContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: ConstantContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: ConstantPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: ConstantPrimaryColor,
    primaryColorDark: Colors.grey[400],
    primaryColorLight: Colors.grey[800],
    scaffoldBackgroundColor: Colors.black,
    textTheme: ThemeData.dark().textTheme.copyWith(
      headline1: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: ConstantContentColorLightTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: ConstantPrimaryColor,
      secondary: ConstantSecondaryColor,
      error: ConstantErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ConstantContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: ConstantColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: ConstantPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(
      c.alpha,
      (c.red * f).round(),
      (c.green  * f).round(),
      (c.blue * f).round()
  );
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round()
  );
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);