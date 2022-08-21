import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

primaryFont({
  double fsize = 26,
  fweight = FontWeight.bold,
  fcolor = kBlackColor,
}) {
  return GoogleFonts.poppins(
      fontSize: fsize, fontWeight: fweight, letterSpacing: 3, color: fcolor);
}

primaryFontDSans({
  double fsize = 24,
  fweight = FontWeight.bold,
  fcolor = kBlackColor,
}) {
  return GoogleFonts.dmSans(
      fontSize: fsize, fontWeight: fweight, letterSpacing: 2, color: fcolor);
}

primaryFontDSansoff({
  double fsize = 24,
  fweight = FontWeight.bold,
  fcolor = kBlackColor,
}) {
  return GoogleFonts.dmSans(
      fontSize: fsize, fontWeight: fweight, color: fcolor);
}

gFontsOleo(
    {Color dcCl = kWhiteColor,
    var td = TextDecoration.none,
    double sz = 16,
    double ls = 0,
    FontWeight fw = FontWeight.bold,
    Color cl = kBlackColor}) {
  return GoogleFonts.mukta(
    decorationColor: dcCl,
    decoration: td,
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}
gFontsLoginbottom(
    {Color dcCl = kWhiteColor,
    var td = TextDecoration.none,
    double sz = 14,
    double ls = 1,
    FontWeight fw = FontWeight.w600,
    Color cl = kBlackColor}) {
  return GoogleFonts.mukta(
    decorationColor: dcCl,
    decoration: td,
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}

