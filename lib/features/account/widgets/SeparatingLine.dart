import 'package:flutter/material.dart';

class SeparatingLine extends StatelessWidget {
  final Color color;
  final double width;

  const SeparatingLine({
    Key? key,
    this.color = const Color.fromARGB(255, 202, 202, 202),
    this.width = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: width,
        ),
      ),
    );
  }
}
