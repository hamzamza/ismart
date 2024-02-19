class SignUpCredentials {
  late String? email = "";
  late String? firstName = "";
  late String? secondName = "";
  late String? password = "";
  late String? rePassword = "";

  SignUpCredentials({this.email, this.password});
  Map<String, dynamic> toJson() {
    return {
      "email": "",
      "firstName": "",
      "secondName": "",
      "password": "",
      "rePassword": ""
    };
  }

  String toJsonString() {
    return " { 'email': email,'firstName': firstName,'secondName';: secondName,'password': password,'rePassword': rePassword} ";
  }
}
