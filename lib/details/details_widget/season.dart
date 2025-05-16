import 'package:flutter/material.dart';

class b extends StatelessWidget {
  final String url;
  final String name;

  const b({required this.name, required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          url,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}



