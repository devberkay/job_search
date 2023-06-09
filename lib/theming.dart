import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Theming {
  static ThemeData get config => ThemeData(
        fontFamily: "Inter",
        scaffoldBackgroundColor: Colors.white,
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent),
      );
}
