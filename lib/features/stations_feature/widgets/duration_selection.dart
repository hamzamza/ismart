import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/features/stations_feature/bloc/bloc.dart';

class DurationSelectionScreen extends StatefulWidget {
  @override
  _DurationSelectionScreenState createState() =>
      _DurationSelectionScreenState();
}

class _DurationSelectionScreenState extends State<DurationSelectionScreen> {
  double _selectedDuration = 30; // Selected duration in minutes
  // Default selected duration in minutes
  @override
  Widget build(BuildContext context) {
    final stationsBloc = context.read<StationsBloc>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(45, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5, left: 6),
                  child: const Text(
                    "Choose Your Charging Time ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                _DurationCard(
                    minutes: 30,
                    selectedDuration: _selectedDuration,
                    onPressed: _onDurationSelected),
                _DurationCard(
                    minutes: 60,
                    selectedDuration: _selectedDuration,
                    onPressed: _onDurationSelected),
                _DurationCard(
                    minutes: 90,
                    selectedDuration: _selectedDuration,
                    onPressed: _onDurationSelected),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(45, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _selectedDuration,
                    min: 0,
                    max: 200,
                    activeColor: Colors.green,
                    inactiveColor: Colors.green[100],
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDuration = newValue;
                      });
                    },
                  ),
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    '  ${_selectedDuration.floor()} min',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[900]),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: (() {
              stationsBloc.add(const ChangePageDuration(charging: true));
            }),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[400]),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.electric_bolt, size: 50, color: Colors.white),
                    Text("Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onDurationSelected(double duration) {
    setState(() {
      _selectedDuration = duration;
    });
  }
}

class _DurationCard extends StatelessWidget {
  final double minutes;
  final double selectedDuration;
  final Function(double) onPressed;

  const _DurationCard({
    required this.minutes,
    required this.selectedDuration,
    required this.onPressed,
  });

  num get price => 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(minutes),
      child: Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4, right: 20, left: 10),
        decoration: BoxDecoration(
            color: selectedDuration == minutes
                ? const Color.fromARGB(174, 200, 230, 201)
                : Colors.transparent),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 60,
                width: 4,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              selectedDuration == minutes
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      color: Colors.green,
                    ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${minutes.floor()} minutes  ",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${minutes * price}   DH ',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
