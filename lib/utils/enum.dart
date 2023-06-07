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
  digitalMoney(formatedName: "Digital Money");

  const WalletsEnum({
    required this.formatedName,
  });

  final String formatedName;
}

extension WalletsGradient on WalletsEnum {
  List<Color>? get color {
    switch (this) {
      case WalletsEnum.amazon:
        return [const Color(0xffE5A663), kdeepOrangeColor.withOpacity(0.8)];
      case WalletsEnum.paypal:
        return [ktealColor, kBlueColor];
      case WalletsEnum.phonePe:
        return [kpurpleAccentColor, kdeepPurpleAccentColor];
      case WalletsEnum.paytm:
        return [kBlueAccentColor, kBlueColor];
      case WalletsEnum.cred:
        return [Colors.black12, Colors.black38];
      case WalletsEnum.digitalMoney:
        return null;
      default:
        return null;
    }
  }
}
