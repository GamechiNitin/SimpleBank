import 'package:flutter/material.dart';

class DMWidget extends StatelessWidget {
  const DMWidget({super.key, this.textAlign = TextAlign.start});
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign!,
      text: TextSpan(
        text: "Digital",
        style: Theme.of(context).appBarTheme.titleTextStyle,
        children: [
          TextSpan(
            text: "Money",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
