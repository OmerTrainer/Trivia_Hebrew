import 'package:flutter/material.dart';

class BottomTabItem extends StatefulWidget {
  final String imageUrl;
  final Function onPressed;
  final bool isTabSelected;

  const BottomTabItem({
    Key? key,
    required this.imageUrl,
    required this.onPressed,
    required this.isTabSelected,
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
        color: widget.isTabSelected
            ? const Color.fromRGBO(79, 124, 191, 1)
            : Colors.black,
      ),
    );
  }
}
