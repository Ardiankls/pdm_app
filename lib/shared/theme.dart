part of 'shared.dart';

class Theme {
  static ThemeData mainTheme() {
    return ThemeData(
      backgroundColor: Color(0xFF161E29),
      primaryColor: Color(0xFF7041FF),
      accentColor: Color(0xFF7041FF),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      // fontFamily: GoogleFonts.lato().fontFamily,
    );
  }
}
