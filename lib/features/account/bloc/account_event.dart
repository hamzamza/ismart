import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ismart/features/account/repository/signIn_credentials.dart';
import 'package:ismart/features/account/repository/signUp_credentials.dart';
import 'package:ismart/features/account/repository/userDetails.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
  @override
  List<Object> get props => [];
}

class SignInEvent extends AccountEvent {
  final BuildContext context;
  final SignInCredentials credential;
  const SignInEvent(this.credential, this.context);
}

class FetchUserDetials extends AccountEvent {}

class SignUpEvent extends AccountEvent {
  final SignUpCredentials credential;
  const SignUpEvent(this.credential);
}

class DeleteAccount extends AccountEvent {}

class UpdateUserDetials extends AccountEvent {
  final UserDetails userDetails;
  const UpdateUserDetials(this.userDetails);
}

class SignOutEvent extends AccountEvent {}
