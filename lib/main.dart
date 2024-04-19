import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';  //is use to stop app using in landscape mode

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 49, 190),
);

var kDarkTheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 9, 99, 150));
void main() {
  // SystemChrome.setPreferredOrientations([// is use to stop app using in landscape mode
  //   DeviceOrientation.portraitUp  //is use to stop app using in landscape mode
  // ]).then((function){  //is use to stop app using in landscape mode
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkTheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkTheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkTheme.primaryContainer,
                foregroundColor: kDarkTheme.onPrimaryContainer),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            foregroundColor: kColorScheme.onPrimaryContainer,
            backgroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 17,
                ),
              ),
        ),
        home: const Expenses()),
  );
}
// );}  //is use to stop app using in landscape mode
