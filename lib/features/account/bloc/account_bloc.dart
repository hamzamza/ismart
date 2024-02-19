import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/account/bloc/account_event.dart';
import '/features/account/bloc/account_state.dart';

import '/common/utils/logger.dart';
import '../repository/account_repository.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _accountRepository;

  AccountBloc(this._accountRepository) : super(const AccountState()) {
    on<SignInEvent>(_onSignInEvent);
    on<FetchUserDetials>(_onFetchUserDetialsEvent);
    on<UpdateUserDetials>(_onUpdateUserDetailsEvent);
    on<SignOutEvent>(_onSignOutEvent);
    on<SignUpEvent>(_onSigUpnEvent);
  }

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(signInCredentials: event.credential));
      emit(state.copyWith(loading: true));
      var islogedin = await _accountRepository.signIn(event.credential);
      if (islogedin) Navigator.pushReplacementNamed(event.context, "/root");
      emit(state.copyWith(loading: false));
    } catch (e) {
      log.severe("there is an error -----------------------------");
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> _onFetchUserDetialsEvent(
    FetchUserDetials event,
    Emitter<AccountState> emit,
  ) async {}

  Future<void> _onUpdateUserDetailsEvent(
    UpdateUserDetials event,
    Emitter<AccountState> emit,
  ) async {}

  Future<void> _onSigUpnEvent(
    SignUpEvent event,
    Emitter<AccountState> emit,
  ) async {}

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<AccountState> emit,
  ) async {}
}
