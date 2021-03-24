part of 'shared.dart';

class MyTheme {
  static ThemeData mainTheme() {
    return ThemeData(
      backgroundColor: Color(0xFF161E29),
      primaryColor: Color(0xFF7041FF),
      accentColor: Color(0xFF7041FF),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      fontFamily: 'Bahnschrift',
      // fontFamily: GoogleFonts.lato().fontFamily,
    );
  }
}
