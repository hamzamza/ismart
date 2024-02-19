import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/features/reservation_feature/screens/reservation_screen.dart';
import 'package:ismart/features/stations_feature/bloc/bloc.dart';
import '/common/ui/screens/home_screen/home_state.dart';
import '/features/account/bloc/account_bloc.dart';
import '/features/stations_feature/screens/stations_screen.dart';

import '../../../../features/account/repository/account_repository.dart';
import '../../../../features/account/screens/account_screen.dart';
import '../../../../features/wallet_feature/bloc/bloc.dart';
import '../../../../features/wallet_feature/repository/wallet_repository.dart';
import '../../../../features/wallet_feature/screens/wallet_screen.dart';
import '../../widgets/app_bottom_bar_withsession.dart';
import '../../widgets/app_floating_action_button.dart';
import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) =>
              WalletBloc(RepositoryProvider.of<WalletRepositoryImpl>(context))
                ..add(FetchWalletInfo()),
        ),
        BlocProvider(
          create: (context) => AccountBloc(
            RepositoryProvider.of<AccountRepositoryImpl>(context),
          ),
        ),
      ],
      child:
          BlocBuilder<StationsBloc, StationsState>(builder: (context, state) {
        return Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state.currentScreen) {
                case AppScreen.map:
                  return const StationsScreen();
                case AppScreen.reservations:
                  return const ReservationScreen();
                case AppScreen.wallet:
                  return const WalletScreen();
                case AppScreen.account:
                  return const AccountScreen();
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: state.ischarging
              ? AppFloatingActionButton(
                  status: "stopped",
                )
              : null,
          bottomNavigationBar:
              ApplicationBottomBar(isinSession: state.ischarging),
          extendBody: true,
        );
      }),
    );
  }
}
