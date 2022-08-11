import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

primaryFont(
    {double fsize = 16,
    fweight = FontWeight.normal,
    fcolor = kWhiteColor,
    
    }) {
  return GoogleFonts.dmSans(
      fontSize: fsize,
      fontWeight: fweight,
     
      letterSpacing: 3,
      color: fcolor);
}
