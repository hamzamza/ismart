import 'package:flutter/material.dart';
import 'package:ismart/common/router/routes.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({Key? key, required this.status})
      : super(key: key);

  final String status;

  Color getColorbyState(String state) {
    switch (state) {
      case "charging":
        return Colors.green;
      case "stopped":
        return Colors.red;
      case "charged":
        return Colors.blue;
      default:
        return Colors
            .grey; // Default color if the status doesn't match any case
    }
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = getColorbyState(status);

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Make the button shape circular
        border: Border.all(
          color: buttonColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(5, 0, 0, 0).withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(3),
      height: 68,
      width: 68,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 0,
          shape: const CircleBorder(),
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.electric_bolt_rounded, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pushNamed(chargingScreenRoute);
          },
        ),
      ),
    );
  }
}
