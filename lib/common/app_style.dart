import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_export.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    height: 1,
  );
}

// light style
TextStyle getLightStyle({double fontSize = n10, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// regular style
TextStyle getRegularStyle({double fontSize = n10, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumStyle({double fontSize = n10, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// semibold style
TextStyle getSemiBoldStyle({
  double fontSize = n10,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// bold style
TextStyle getBoldStyle({double fontSize = n10, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
