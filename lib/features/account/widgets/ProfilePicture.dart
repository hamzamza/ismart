import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const ProfilePicture({
    required this.imageUrl,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: borderRadius * 2,
        height: borderRadius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 4.0,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: borderRadius * 2,
            height: borderRadius * 2,
          ),
        ),
      ),
    );
  }
}
