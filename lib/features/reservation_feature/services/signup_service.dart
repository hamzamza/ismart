import 'package:ismart/features/account/repository/signUp_credentials.dart';

abstract class SignInService {
  Future<SignUpCredentials> signIn();
  Future<void> logOut();
}

class SignInServiceImpl implements SignInService {
  @override
  Future<SignUpCredentials> signIn() async {
    return await SignUpCredentials();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
