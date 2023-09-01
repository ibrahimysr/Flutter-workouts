import 'package:flutter/material.dart';

import 'package:workouts/ui/colorshema.dart';

class AppTheme {
  ColorSheme get _colorshemes => ColorSheme.instance;
  static AppTheme? _instance;
  static AppTheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppTheme.init();
      return _instance!;
    }
  }

  AppTheme.init();

//tema ayarları burda yapılıyor
  ThemeData get theme => ThemeData(

      //istedigin temaları aşagodaki appbar gibi yap
      scaffoldBackgroundColor: _colorshemes.background,
      appBarTheme: _AppBatTheme,
      floatingActionButtonTheme: _floatingactionTheme,
      chipTheme: _chipTheme,
      elevatedButtonTheme: _elevatedButtontheme);

  AppBarTheme get _AppBatTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: _colorshemes.siyah,
        foregroundColor: _colorshemes.siyah,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      );
  FloatingActionButtonThemeData get _floatingactionTheme =>
      FloatingActionButtonThemeData(backgroundColor: _colorshemes.koyu_siyah);
  ChipThemeData get _chipTheme => ChipThemeData(
        backgroundColor: _colorshemes.siyah,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
      );
  ElevatedButtonThemeData get _elevatedButtontheme => ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: _colorshemes.siyah,
      ));
}
