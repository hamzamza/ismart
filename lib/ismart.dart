import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/common/router/routes.dart';
import 'package:ismart/features/account/bloc/bloc.dart';
import 'package:ismart/features/account/repository/account_repository.dart';
import 'package:ismart/features/stations_feature/bloc/bloc.dart';
import 'package:ismart/features/stations_feature/repository/station_repository.dart';

class Ismart extends StatelessWidget {
  final bool isLogedIn;
  const Ismart({super.key, this.isLogedIn = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<StationsBloc>(
            create: (context) => StationsBloc(
                RepositoryProvider.of<StationRepositoryImpl>(context))
              ..add(FetchStationsEvent()),
          ),
          BlocProvider<AccountBloc>(
            create: (context) => AccountBloc(
                RepositoryProvider.of<AccountRepositoryImpl>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'ismart mobile app',
          initialRoute: isLogedIn ? homeScreenPath : signInScreenRoute,
          routes: routes,
        ));
  }
}
