import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/common/network/network.dart';
import 'package:ismart/features/account/repository/account_repository.dart';
import 'package:ismart/features/account/services/login_service.dart';
import 'package:ismart/features/stations_feature/repository/station_repository.dart';
import 'package:ismart/features/stations_feature/services/location_service.dart';
import 'package:ismart/features/stations_feature/services/stations_api_service.dart';
import 'package:ismart/features/wallet_feature/repository/wallet_repository.dart';
import 'package:ismart/features/wallet_feature/services/wallet_serivce.dart';

class RepositoryHolder extends StatelessWidget {
  final Widget child;

  const RepositoryHolder({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => StationRepositoryImpl(
            stationApiService: StationsApiServiceImpl(
              ApiClientImpl(),
            ),
            locationService: LocationServiceImpl(),
          ),
        ),
        RepositoryProvider(
          create: (context) => WalletRepositoryImpl(
            walletService: WalletServiceImpl(
              ApiClientImpl(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => AccountRepositoryImpl(
            SignInServiceImpl(),
          ),
        ),
      ],
      child: Builder(builder: (context) => child),
    );
  }
}
