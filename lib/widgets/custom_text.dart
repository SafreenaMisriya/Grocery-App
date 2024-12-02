import 'package:billing_system_app/widgets/mediaquery.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  const CustomText(
      {super.key,
      required this.text,
      this.textOverflow,
      required this.size,
      required this.color,
      this.textAlign,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: weight,
          overflow: textOverflow,
          color: color,
          fontSize: mediaquerywidth(size, context)),
    );
  }
}

class AppdecorText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;
  const AppdecorText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: weight,
          color: color,
          fontSize: mediaquerywidth(size, context)),
    );
  }
}
