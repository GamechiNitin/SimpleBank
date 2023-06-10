import 'package:flutter/material.dart';
import 'package:simple_bank/utils/colors.dart';

enum WatchListCategories {
  bank,
  stock,
  funds,
  crypto,
  wallets;
}

enum WalletsEnum {
  amazon(formatedName: "Amazon Pay"),
  phonePe(formatedName: "Phone Pe"),
  paypal(formatedName: "PayPal"),
  paytm(formatedName: "Paytm"),
  cred(formatedName: "Cred"),
  apple(formatedName: "Apple Pay"),
  digitalMoney(formatedName: "Digital Money");

  const WalletsEnum({
    required this.formatedName,
  });

  final String formatedName;
}

extension WalletsGradient on String {
  List<Color>? get color {
    switch (this) {
      case "Amazon Pay":
        return [const Color(0xffE5A663), kdeepOrangeColor.withOpacity(0.8)];
      case "PayPal":
        return [ktealColor, kBlueColor];
      case "Phone Pe":
        return [kpurpleAccentColor, kdeepPurpleAccentColor];
      case "Paytm":
        return [kBlueAccentColor, kBlueColor];
      case "Cred":
        return [Colors.black38, Colors.black87];
      case "Apple Pay":
        return [kWhiteColor.withOpacity(0.2), kWhiteColor.withOpacity(0.5)];
      case "Digital Money":
        return [kPrimaryColor, kBlueAccentColor.withOpacity(0.7)];
      default:
        return null;
    }
  }
}

extension Res on String {
  String get addSpace =>
      replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
}
