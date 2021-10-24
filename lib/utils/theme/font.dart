import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontTheme {
  static TextStyle whiteFontStyle = GoogleFonts.roboto(fontSize: 14, color: Colors.white);
  static TextStyle greyFontStyle = GoogleFonts.roboto(fontSize: 12, color: Colors.grey);
  static TextStyle blackFontStyle = GoogleFonts.roboto(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold);
}
