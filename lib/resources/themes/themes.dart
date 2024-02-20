import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        primaryColor: const Color(0xff0165FC),
        primaryColorLight: const Color(0xffFFFFFF),
        primaryColorDark: const Color(0xff000000),
        disabledColor: Colors.grey,
        focusColor: const Color(0xff0165FC),
        colorScheme: const ColorScheme.light(
            error: Color(0xffFE0000), primary: Color(0xff0165FC)),
        textTheme: TextTheme(
          headlineSmall: GoogleFonts.rubik(fontWeight: FontWeight.w500),
          bodyMedium: GoogleFonts.poppins(),
          titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          labelLarge:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0165FC),
                minimumSize: const Size(double.maxFinite, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)))),
        inputDecorationTheme: InputDecorationTheme(
          // prefixIconColor: Color(0xff0165FC),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.0))),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color.fromARGB(255, 67, 70, 74)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(const Color(0xff0165FC)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        navigationBarTheme:
            const NavigationBarThemeData(backgroundColor: Colors.blueAccent));
  }
}
