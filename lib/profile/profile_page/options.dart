import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  const Options({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? Colors.grey.shade800;

    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          color: textColor,
          onPressed: onPressed,
        ),
        Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
