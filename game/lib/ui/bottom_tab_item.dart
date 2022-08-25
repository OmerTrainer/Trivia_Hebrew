import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomTabItem extends StatefulWidget {
  final String imageUrl;
  final Function onPressed;

  const BottomTabItem({
    Key? key,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BottomTabItem> createState() => _BottomTabItemState();
}

class _BottomTabItemState extends State<BottomTabItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: Image.asset(
        widget.imageUrl,
      ),
    );
  }
}
