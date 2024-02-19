import 'package:equatable/equatable.dart';
import 'package:ismart/features/account/repository/signIn_credentials.dart';
import 'package:ismart/features/account/repository/signUp_credentials.dart';
import 'package:ismart/features/account/repository/userDetails.dart';

class AccountState extends Equatable {
  final SignInCredentials? signInCredentials;
  final SignUpCredentials? signUpCredentials;
  final bool loading;
  final bool isLogedIn;
  final UserDetails? userDetails;
  const AccountState(
      {this.signInCredentials,
      this.signUpCredentials,
      this.loading = false,
      this.userDetails,
      this.isLogedIn = false});
  AccountState copyWith({
    SignInCredentials? signInCredentials,
    SignUpCredentials? signUpCredentials,
    bool? loading,
  }) {
    return AccountState(
      signInCredentials: signInCredentials ?? this.signInCredentials,
      signUpCredentials: signUpCredentials ?? this.signUpCredentials,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [signInCredentials, signUpCredentials, loading];
}
