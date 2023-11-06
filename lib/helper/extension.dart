import 'package:flutter/material.dart';
import 'package:m_dharura/constant/dictionary.dart';

extension DateTimeExtension on DateTime {
  DateTime startOfDay() {
    DateTime dateTime = DateTime(year, month, day);

    return dateTime;
  }

  DateTime endOfDay() {
    DateTime dateTime = DateTime(year, month, day, 23, 59, 59, 999);

    return dateTime;
  }
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> trim() {
    Map<String, dynamic> data = {};

    for (var key in keys) {
      if (kFieldDictionary.keys.contains(key)) {
        data[kFieldDictionary[key].toString()] = this[key];
      } else {
        data[key] = this[key];
      }
    }

    return data;
  }
}

extension StringExtension on String {
  Color toColor() {
    var hex = replaceAll("#", "");

    Color converted = Colors.black;

    if (hex.length == 6) {
      converted = Color(int.parse("0xFF$hex"));
    } else if (hex.length == 8) {
      converted = Color(int.parse("0x$hex"));
    }

    return converted;
  }
}
