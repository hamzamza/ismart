import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final accountBloc = context.watch<AccountBloc>();
    final photoUrl = "accountBloc.state.userCredential?.user?.photoURL";
    return Column(
        // mainAxisSize: MainAxisSize.min,
        // children: [
        //   CircleAvatar(
        //     backgroundImage: NetworkImage(photoUrl),
        //     radius: 60,
        //   ),
        //   const SizedBox(height: 16),
        //   AccountInfoFiled(
        //     label: 'Name',
        //     icon: Icons.person,
        //     value: accountBloc.state.userCredential?.username ?? "",
        //   ),
        //   const SizedBox(height: 16),
        //   AccountInfoFiled(
        //     label: 'Email',
        //     icon: Icons.email,
        //     value: accountBloc.state.userCredential?.email ?? '',
        //   )
        // ],
        );
  }
}
