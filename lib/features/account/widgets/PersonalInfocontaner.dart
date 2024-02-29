import 'package:flutter/material.dart';

class PersonalInfoContainer extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  const PersonalInfoContainer({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        child: Row(
          children: [
            Icon(
              iconData,
              color: const Color.fromARGB(255, 25, 149, 250),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Color.fromARGB(255, 160, 160, 160)),
            ),
          ],
        ),
      ),
    );
  }
}
