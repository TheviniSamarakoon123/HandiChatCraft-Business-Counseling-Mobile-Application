import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 236, 9, 9), fontSize: 30),
    headlineSmall: GoogleFonts.calistoga(
        color: const Color(0x9A953403),
        fontSize: 20,
        fontWeight: FontWeight.bold),
    bodySmall: GoogleFonts.poppins(
      color: const Color.fromARGB(255, 234, 29, 29),
      fontSize: 10,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
      headlineMedium: GoogleFonts.montserrat(
          color: const Color.fromARGB(255, 236, 9, 9), fontSize: 30),
      headlineSmall: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 24,
      ),
      bodySmall: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 10,
      ));
}*/

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      color: const Color.fromARGB(255, 236, 9, 9),
      fontSize: 30,
    ),
    headlineSmall: GoogleFonts.calistoga(
      color: const Color(0x9A953403),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: GoogleFonts.poppins(
      color: const Color.fromARGB(255, 234, 29, 29),
      fontSize: 10,
    ),
    /*nameTextStyle: TextStyle(
      color: Colors.red, // Set the text color for light mode
      // Define other properties like fontSize, fontWeight, etc. if needed
    ),*/
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.white, // Set the text color for dark mode
      fontSize: 30,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 24,
    ),
    bodySmall: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 10,
    ),
    // Add more text styles for dark mode as needed
  );
}
