import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/common/ui/widgets/bottom_bar_item.dart';
import '/features/wallet_feature/bloc/bloc.dart';
import '../screens/home_screen/home_bloc.dart';
import '../screens/home_screen/home_event.dart';
import '../screens/home_screen/home_state.dart';

class ApplicationBottomBar extends StatelessWidget {
  final bool isinSession;
  ApplicationBottomBar({Key? key, required this.isinSession}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.all(1),
      surfaceTintColor: Colors.white,
      height: 60,
      elevation: 40,
      shape: const CircularNotchedRectangle(),
      child: isinSession
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  icon: Icons.map,
                  label: 'Carte',
                  isSelected: homeBloc.state.currentScreen == AppScreen.map,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.map));
                  },
                ),
                BottomBarItem(
                  icon: Icons.swipe_up_outlined,
                  label: 'Pass',
                  isSelected:
                      homeBloc.state.currentScreen == AppScreen.reservations,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.reservations));
                  },
                ),
                const SizedBox(width: 45),
                BottomBarItem(
                  icon: Icons.wallet,
                  label: 'Contribuer',
                  isSelected: homeBloc.state.currentScreen == AppScreen.wallet,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.wallet));
                  },
                ),
                BottomBarItem(
                  icon: Icons.account_circle_rounded,
                  label: 'Compte',
                  isSelected: homeBloc.state.currentScreen == AppScreen.account,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.account));
                  },
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  icon: Icons.map,
                  label: 'Carte',
                  isSelected: homeBloc.state.currentScreen == AppScreen.map,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.map));
                  },
                ),
                BottomBarItem(
                  icon: Icons.swipe_up_outlined,
                  label: 'Pass',
                  isSelected:
                      homeBloc.state.currentScreen == AppScreen.reservations,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.reservations));
                  },
                ),
                BottomBarItem(
                  icon: Icons.wallet,
                  label: 'Contribuer',
                  isSelected: homeBloc.state.currentScreen == AppScreen.wallet,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.wallet));
                  },
                ),
                BottomBarItem(
                  icon: Icons.account_circle_rounded,
                  label: 'Compte',
                  isSelected: homeBloc.state.currentScreen == AppScreen.account,
                  onPressed: () {
                    homeBloc.add(SwitchTabEvent(AppScreen.account));
                  },
                ),
              ],
            ),
    );
  }
}
