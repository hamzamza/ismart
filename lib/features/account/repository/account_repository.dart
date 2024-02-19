import 'package:ismart/common/network/network.dart';
import 'package:ismart/common/services/secure_cache.dart';
import 'package:ismart/features/account/repository/signIn_credentials.dart';
import 'package:ismart/features/account/repository/signUp_credentials.dart';

import 'package:ismart/features/account/services/login_service.dart';

abstract class AccountRepository {
  final SignInService signInService;
  const AccountRepository({
    required this.signInService,
  });
  Future<bool> signIn(SignInCredentials credential);
  Future<bool> signUp(SignUpCredentials credential);
  Future<void> logOut();
}

class AccountRepositoryImpl
    with SecureStorageMixin
    implements AccountRepository {
  final client = ApiClientImpl();
  @override
  final SignInService signInService;
  AccountRepositoryImpl(this.signInService);

  @override
  Future<bool> signIn(SignInCredentials credential) async {
    var response = await client.post("/auth/signin", credential.toJson());
    var islogedIn = response["status"] == "success";
    if (islogedIn) writeAuthToken(response["token"]);
    return islogedIn;
  }

  @override
  Future<void> logOut() async {
    await Future;
  }

  @override
  Future<bool> signUp(SignUpCredentials credential) async {
    var response = await client.post("/auth/signUp", credential.toJson());
    var islogedIn = response["status"] == "success";
    if (islogedIn) writeAuthToken(response["token"]);
    return islogedIn;
  }
}



// ahmed@gmail.com 
// 1234