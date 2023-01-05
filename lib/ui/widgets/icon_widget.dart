import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final double height;

  final Color? backGroundColor;
  final Color? iconColor;

  final double padding;

  const IconWidget({
    Key? key,
    required this.icon,
    this.height = 40,
    this.backGroundColor,
    this.iconColor,
    this.padding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backGroundColor ?? Colors.blue),
      alignment: Alignment.center,
      child: FaIcon(
        icon,
        color: iconColor ?? Colors.white,
        size: 15,
      ),
    );
  }
}
