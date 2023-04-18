import 'package:flutter/material.dart';

/// Most color assignments in Rally are not like the typical color
/// assignments that are common in other apps. Instead of primarily mapping to
/// component type and part, they are assigned round robin based on layout.

class MomoColors {
  static const List<Color> accountColors = <Color>[
    //  Color(0xFFFFDC78),
    Color(0xFFFF6951),
    // Color(0xFFFFD7D0),
    Color(0xFFFFAC12),
  ];

  static const List<Color> billColors = <Color>[
    // Color(0xFFFFDC78),
    Color(0xFFFF6951),
    // Color(0xFFFFD7D0),
    Color(0xFFFFAC12),
  ];

  static const List<Color> budgetColors = <Color>[
    // Color(0xFFFFDC78),
    Color(0xFFFF6951),
    // Color(0xFFFFD7D0),
    Color(0xFFFFAC12),
  ];

  // f5f5ef,0b0908,facb0b,f1d95f,8e7935,7c5b0b,b09639,c39f33,747c7c

  static const Color gray = Color(0xFFD8D8D8);
  // static const Color gray60 = Color(0x99D8D8D8);
  // static const Color gray25 = Color(0x40D8D8D8);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  // static const Color primaryBackground = Color(0xFF33333D);
  static Color primaryBackground = const Color(0xFFFFCB05);
  static const Color inputBackground = Color(0xFF26282F);
  static const Color cardBackground = Color(0x03FEFEFE);
  static const Color buttonColor = Color(0xFF09AF79);
  static const Color focusColor = Colors.black;
  static const Color dividerColor = Color(0xAA282828);

  static const Color uiColor = Color(0xFFFFFFFF);

  static const Color primaryButtonColor = Color(0xFFFFCB05);
  static const Color secondaryButtonColor = Color(0xFF0b76db);

  static const Color momoLightColor = Color(0xFF4D849C);
  static const Color momoBlueColor = Color(0xFF004F71);
  static const Color momoDarkColor = Color(0xFF003654);

  /// Convenience method to get a single account color with position i.
  static Color accountColor(int i) {
    return cycledColor(accountColors, i);
  }

  /// Convenience method to get a single bill color with position i.
  static Color billColor(int i) {
    return cycledColor(billColors, i);
  }

  /// Convenience method to get a single budget color with position i.
  static Color budgetColor(int i) {
    return cycledColor(budgetColors, i);
  }

  /// Gets a color from a list that is considered to be infinitely repeating.
  static Color cycledColor(List<Color> colors, int i) {
    return colors[i % colors.length];
  }
}

class MomoImages {
  static const String darkBlue = 'assets/logo/darkBlue.png';
  static const String vdarkBlue = 'assets/logo/vdarkBlue.png';
  static const String lightBlue = 'assets/logo/lightBlue.png';
  static const String vlightBlue = 'assets/logo/vlightBlue.png';
  final String logoBlue = 'assets/logo/bluebg.png';
  final String logobg = 'assets/logo/logobg.png';
  static const String vlogoBlue = 'assets/logo/vbluebg.png';

  static const String welc0 = 'assets/images/1.png';
  static const String welc1 = 'assets/images/2.png';
  static const String welc2 = 'assets/images/3.png';
  static const String backauth = 'assets/images/5.png';
  static const String check = 'assets/images/check.png';
   static const String eror = 'assets/images/eror.png';
  final String scan = 'assets/images/scan.png';
  static const String gologo = 'assets/images/logo.png';
  static const String pub = 'assets/images/pub.jpeg';
}

class MomoIcons {
  static const String darkBlue = 'assets/logo/darkBlue.png';
  static const String vdarkBlue = 'assets/logo/vdarkBlue.png';
  static const String lightBlue = 'assets/logo/lightBlue.png';
  static const String vlightBlue = 'assets/logo/vlightBlue.png';
  final String logoBlue = 'assets/logo/bluebg.png';
  final String logobg = 'assets/logo/logobg.png';
  static const String vlogoBlue = 'assets/logo/vbluebg.png';

  final String deposit = 'assets/svg/Accept deposits Web.svg';
  final String cashout = 'assets/svg/Cashout.svg';
  final String disburs = 'assets/svg/Disbursement.svg';
  final String earn = 'assets/svg/Earn commission on airtime, data & prepaid electricity sales Web.svg';
  final String facilitate = 'assets/svg/Facilitate cash transactions Web.svg';
  final String pay = 'assets/svg/Pay your bills Web.svg';
  final String pub = 'assets/svg/pub.svg';
}
