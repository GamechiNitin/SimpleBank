import 'package:flutter/material.dart';
import 'package:simple_bank/utils/colors.dart';

class CustomDecoration {
  static InputBorder kSearchInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: kWhiteColor,
      width: 1.5,
    ),
  );
  static InputBorder kInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: kLPrimaryColor,
      width: 1.5,
    ),
  );
  static InputBorder kErrorInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: kErrorColor,
      width: 1.5,
    ),
  );

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
        offset: const Offset(5, 5),
        blurRadius: 10,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.grey.shade300,
        offset: const Offset(-5, -5),
        blurRadius: 10,
        spreadRadius: 1,
      ),
    ],
  );
}
