import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/features/stations_feature/bloc/bloc.dart';
import 'package:ismart/features/stations_feature/screens/payment_type_screen.dart';
import 'package:ismart/features/stations_feature/screens/qr_code_Scanner_srcreen.dart';
import 'package:ismart/features/stations_feature/widgets/duration_selection.dart';
import '/features/stations_feature/widgets/charging_card.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationsBloc, StationsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white24,
          title: const Text(
            'Charging Session',
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: state.ischarging
              ? const ChargingCard()
              : (state.page == 0
                  ? const QrCodeScreen()
                  : state.page == 1
                      ? PaymentType()
                      : DurationSelectionScreen()),
        ),
      );
    });
  }
}
