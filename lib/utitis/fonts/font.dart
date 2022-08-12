import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

primaryFont(
    {double fsize = 26,
    fweight = FontWeight.bold,
    fcolor = kBlackColor,
    
    }) {
  return GoogleFonts.poppins(
      fontSize: fsize,
      fontWeight: fweight,
     
      letterSpacing: 3,
      color: fcolor);
}
primaryFontDSans(
    {double fsize = 24,
    fweight = FontWeight.bold,
    fcolor = kBlackColor,
    
    }) {
  return GoogleFonts.dmSans(
      fontSize: fsize,
      fontWeight: fweight,
     
      letterSpacing: 2,
      color: fcolor);
}
primaryFontDSansoff(
    {double fsize = 24,
    fweight = FontWeight.bold,
    fcolor = kBlackColor,
    
    }) {
  return GoogleFonts.dmSans(
      fontSize: fsize,
      fontWeight: fweight,
     
    
      color: fcolor);
}

