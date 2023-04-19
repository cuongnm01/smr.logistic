import 'package:flutter/material.dart';

class AppColor {
  AppColor();

  /// Light Color
  static Color defaultHeaderOSColorLight =
      const Color(0xFFFFEFF4); // light pink
  static Color primaryColorLight = const Color(0xFFDF4D6F); // dark pink
  static Color accentColorLight = const Color(0xFFFFFFFF); // white
  static Color dividerColorLight = const Color(0xFF959595); // grey
  static Color secondColorLight = const Color(0xFFFF7DA5); // light pink
  static Color onlineColor = const Color(0xFF27AE60); // green
  static Color offlineColor = const Color(0xFF2D9CDB); // blue
  static Color greenColorLight = const Color(0xFF27AE60);
  static Color blueColorLight = const Color(0xFF2D9CDB);
  static Color appbarColorLight = const Color(0xFFE5E5E5);
  static Color borderGrayColorLight = const Color(0xFFB8B8B8);
  static Color borderPinkColorLight = const Color(0xFFFFBED2);
  static Color borderPinkBoldColor = const Color(0xFFFF9EBC);

  //Text
  static Color primaryTextColorLight = const Color(0xFFC62828); // pink
  static Color secondTextColorLight = const Color(0xFFFFFFFF); // white
  static Color thirdTextColorLight = const Color(0xFF000000); // black
  static Color fourthTextColorLight = const Color(0xFF4E4E4E); // light gray
  static Color fifthTextColorLight = const Color(0xFF888888); // gray
  static Color sixTextColorLight = const Color(0xFF717171); // gray
  static Color sevenTextColorLight = const Color(0xFF1B1B1E); // gray
  static Color eightTextColorLight = const Color(0xFF3B3B3B); // green
  static Color niceTextColorLight = const Color(0xFF3B3B3B);
  static Color menuTextColorLight = const Color(0xFFB8B8B8);
  static Color textBlack = const Color(0xff333333);
  static Color blueTextColor = const Color(0xFF007AFF);
  static Color redTextColor = const Color(0xFFFF2323);
  static Color greenTextColor = const Color(0xFF34C759);

  //Hint
  static Color primaryHintColor = const Color(0xffFF6B6B);
  static Color primaryHintColorLight = const Color(0xFF888888); // gray

  static Color primaryBorderColorLight = const Color(0xFFF0F0F0); // gray
  static Color primarySelectedColorLight = const Color(0xFFADADAD); // gray

  //backround
  static Color primaryBackgroundColorLight = const Color(0xFFFFFFFF);
  static Color secondBackgroundColorLight = const Color(0xFFFFEFF4);
  static Color greyBackgroundColor = const Color(0xFFEEEEEE);

  static Color errorColor = const Color(0xFFEE0707);
  static Color disabledColorLight = const Color(0xFFADADAD); // gray
  static Color cursorColor = const Color(0xff333333);
  static Color shadowColorLight = const Color(0xFFE5E5E5); // black26

  static const Color colorFF7AA3 = Color(0xFFFF7AA3);
  static const Color colorFF4880 = Color(0xFFFF4880);
  static const Color primaryPink50 = Color(0xFFFCEEF1);

  // new text
  static Color primaryColor = const Color(0xFFC62828);
  static Color secondaryColor = const Color(0xFFF15A29);
  static Color primaryNavigationBarColor = const Color(0xFF373737);
  static Color baseColor = const Color(0xFF607D8B);

  static Color primaryBackgroundColor = Colors.white;
  static Color secondBackgroundColor = neutral9;
  static Color thirdBackgroundColor = const Color(0xFFEEF2FA);
  static Color buttonBackgroundColor = const Color(0xFF493083);
  static Color cancelBackgroundColor = neutral7;
  static Color errorBackgroundColor = const Color(0xFFFFF1ED);
  static Color commentBackgroundColor = neutral9;
  static Color pollBackgroundColor = const Color(0xFFE5EDF9);
  static Color chatBackgroundColor = neutral9;
  static Color messageBackgroundColor = const Color(0xFFE7EAEE);
  static Color mediaBackgroundColor = const Color(0xFFE0E0E0);

  static Color primaryTextColor = neutral;
  static Color secondTextColor = Colors.white;
  static Color thirdTextColor = neutral1;
  static Color fourthTextColor = const Color(0xFF9098A1);
  static Color fifthTextColor = neutral6;

  static Color primaryButtonColor = const Color(0xFF9098A1);
  static Color secondButtonColor = const Color(0xFF10C17D);
  static Color thirdButtonColor = neutral1;
  static Color fourButtonColor = const Color(0xFFFFFCFF);

  static Color dividerColor = neutral7;

  static Color primaryBorderColor = neutral8;

  static Color canvasColor = Colors.white;
  static Color disabledColor = const Color(0xFFADADAD);
  static Color shadowColor = Colors.black12;
  static Color badgeColor = const Color(0xFFFF754C);

  static Color neutral = const Color(0xFF09101D);
  static Color neutral1 = const Color(0xFF2C3A4B);
  static Color neutral2 = const Color(0xFF394452);
  static Color neutral3 = const Color(0xFF545D69);
  static Color neutral4 = const Color(0xFF6D7580);
  static Color neutral5 = const Color(0xFF858C94);
  static Color neutral6 = const Color(0xFFA5ABB3);
  static Color neutral7 = const Color(0xFFDADEE3);
  static Color neutral8 = const Color(0xFFEBEEF2);
  static Color neutral9 = const Color(0xFFF4F6F9);

  static Color stateError = const Color(0xFFFF754C);
  static Color statusSuccessBG = const Color(0xFFEDF9F0);
  static Color statusSuccess = const Color(0xFF23A757);

  static Color blackColor = Colors.black;
  static Color textGrayColor = const Color(0xFF888888);
  static Color actionNeutral = const Color(0xFF9098A1);
  static Color grayScale = const Color(0xFFCCCCCC);
  static Color stateInfoColor = const Color(0xFF4076D4);

  static Color unLikeColor = const Color(0xFF493083);
  static Color likeColor = const Color(0xFF493083);
  static Color loveColor = const Color(0xFFFF754C);
  static Color careColor = const Color(0xFFFFCE73);
  static Color hahaColor = const Color(0xFFFFCE73);
  static Color wowColor = const Color(0xFFFFCE73);
  static Color sadColor = const Color(0xFFFFCE73);
  static Color angryColor = const Color(0xFFFF754C);
  static Color backgroundCropColor = const Color(0xFF09101D);

  static Color gradientViolet1 = const Color(0xFF4C3285);
  static Color gradientViolet2 = const Color(0xFFAD71AC);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
