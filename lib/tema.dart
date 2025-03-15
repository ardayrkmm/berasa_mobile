import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Color biru = Color(0xff1D75F2);
Color biruCerah = Color(0xffC1DFFD);
Color abu2 = Color(0xff383838);
Color abu2Cerah = Color(0xffEBEBEB);
Color putih = Color(0xffFFFFFF);
Color oren = Color(0xffFFBF67);
Color kuning = Color(0xffF8E646);
LinearGradient biruGradient = LinearGradient(
  colors: [Color(0xff1D75F2), Color(0xff1AC6FB)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

TextStyle biruStyle = GoogleFonts.openSans(color: biru);
TextStyle biruCerahStyle = GoogleFonts.openSans(color: biruCerah);
TextStyle abu2Sty = GoogleFonts.openSans(color: abu2);
TextStyle abu2CerahSty = GoogleFonts.openSans(color: abu2Cerah);
TextStyle putihSty = GoogleFonts.openSans(color: putih);
TextStyle orenSty = GoogleFonts.openSans(color: oren);
TextStyle KuningSty = GoogleFonts.openSans(color: kuning);

double marginSemua = 32;

FontWeight bold = FontWeight.w800;
FontWeight semiBold = FontWeight.w600;
FontWeight light = FontWeight.w300;
