import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_bank/cubit/theme_cubit/dark_mode_cubit.dart';
import 'package:simple_bank/utils/colors.dart';

class CustomDecoration {
  static Decoration watchDarkDeocoration = BoxDecoration(
    color: kDarkGrey1Color,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        color: Colors.black87,
        offset: Offset(10, 10),
        blurRadius: 30,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.black26,
        offset: Offset(-10, -10),
        blurRadius: 30,
        spreadRadius: 1,
      ),
    ],
  );
  static Decoration watchLightDeocoration = BoxDecoration(
    color: kLightWhiteColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        offset: Offset(5, 5),
        blurRadius: 10,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.grey.shade300,
        offset: Offset(-5, -5),
        blurRadius: 10,
        spreadRadius: 1,
      ),
    ],
  );
}
