import 'package:flutter/material.dart';
import 'package:workouts/ui/extension.dart';

class ColorSheme {
  static ColorSheme? _instance;
  static ColorSheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ColorSheme.init();
      return _instance!;
    }
  }

  ColorSheme.init();

  static final Map<String, String> _colors = {
    "Background": "d9d8da",
    "Gri": "5c5a5c",
    "Siyah": "151415",
    "Koyu Siyah": "191819"
  };

  Color get gri => Hexcolor.fromHex(_colors["Gri"]!);
  Color get siyah => Hexcolor.fromHex(_colors["Siyah"]!);
  Color get koyu_siyah => Hexcolor.fromHex(_colors["Koyu Siyah"]!);
  Color get background => Hexcolor.fromHex(_colors["Background"]!);
}
