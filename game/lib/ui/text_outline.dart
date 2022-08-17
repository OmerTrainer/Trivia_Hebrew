import 'package:flutter/material.dart';

class TextOutline extends StatelessWidget {
  const TextOutline(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.colorOutline,
      required this.colorFill,
      required this.fontWeight})
      : super(key: key);
  final String text;
  final double fontsize;
  final double fontWeight;
  final Color colorOutline;
  final Color colorFill;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontsize,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = fontWeight
              ..color = colorOutline,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontsize,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            color: colorFill,
          ),
        ),
      ],
    );
  }
}
