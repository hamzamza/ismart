class SignInCredentials {
  late String? email = "";
  late String? password = "";
  SignInCredentials({this.email, this.password});
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  String toJsonString() {
    return " {'email' : $email , 'password' : $password} ";
  }
}
