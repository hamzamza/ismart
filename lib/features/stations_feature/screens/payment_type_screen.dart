import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/features/stations_feature/bloc/bloc.dart';

class PaymentType extends StatefulWidget {
  @override
  _PaymentTypeState createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  String _selectedPaymentType = ""; // Selected duration in minutes
  String _avecab = "Avec Abonnement";
  String _sansab = "Sans Abonnement";
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
                    "Choose Your payment methode ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                _PaymentType(
                    selectedMethod: _selectedPaymentType,
                    method: _avecab,
                    onPressed: _onPymentSelected),
                _PaymentType(
                    selectedMethod: _selectedPaymentType,
                    method: _sansab,
                    onPressed: _onPymentSelected),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: (() {
              stationsBloc.add(const ChangeingPageEvent(page: 2));
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
                    Text("Next",
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

  void _onPymentSelected(String type) {
    setState(() {
      _selectedPaymentType = type;
    });
  }
}

class _PaymentType extends StatelessWidget {
  final String selectedMethod;
  final Function(String) onPressed;
  final String method;
  const _PaymentType({
    required this.method,
    required this.selectedMethod,
    required this.onPressed,
  });

  num get price => 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(method),
      child: Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4, right: 20, left: 10),
        decoration: BoxDecoration(
            color: selectedMethod == method
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
              selectedMethod == method
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
                      method,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
