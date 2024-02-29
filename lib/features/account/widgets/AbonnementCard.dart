import 'package:flutter/material.dart';

class AbonnementCard extends StatelessWidget {
  final String title;
  final String text;
  final Function()? onPress;
  final String imageUrl;

  const AbonnementCard({
    Key? key,
    required this.title,
    required this.text,
    this.onPress,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 202, 202, 202),
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  width: 1,
                ),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 180, 180, 180)),
                )
              ],
            )),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.7,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              child: const Text(
                "sourcire",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 110, 4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
