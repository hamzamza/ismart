import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const BottomBarItem({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: 20,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
