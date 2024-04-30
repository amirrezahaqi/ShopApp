import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizedBoxExtension on double {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}

extension IntExtension on int {
  String get seprateWithComma {
    final numFormat = NumberFormat.decimalPattern();
    return numFormat.format(this);
  }
}
