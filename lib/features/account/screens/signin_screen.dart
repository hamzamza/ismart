import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismart/common/router/routes.dart';
import 'package:ismart/features/account/bloc/bloc.dart';
import 'package:ismart/features/account/repository/signIn_credentials.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInScreen> {
  late bool validEmail;
  var credential = SignInCredentials();
  @override
  void initState() {
    super.initState();
    credential.email = "";
    credential.password = "";
    validEmail = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  final FocusNode emailnode = FocusNode();
  final FocusNode passwordnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: Container(
                height: double.infinity,
                child: Stack(children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/svgs/dots.svg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          margin: const EdgeInsets.only(top: 50),
                          child: Center(
                              child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ismart_logo_dark.jpg'))),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: const Text(
                                          "Pour créer un compte, veuillez saisir votre adresse e-mail. Notre service client vous contactera pour créer votre compte et préparer une carte iSmart afin de faciliter votre recharge et simplifier votre vie",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 12),
                                      decoration: BoxDecoration(
                                        border: emailnode.hasFocus
                                            ? Border.all(
                                                color: validEmail
                                                    ? Colors.white
                                                    : const Color.fromARGB(
                                                        255, 202, 67, 67),
                                                width: 3)
                                            : Border.all(
                                                color: validEmail
                                                    ? const Color(0xFFABCA43)
                                                    : const Color.fromARGB(
                                                        255, 202, 67, 67),
                                                width: 2),
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        cursorColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            credential.email = value;
                                          });
                                        },
                                        focusNode: emailnode,
                                        onTap: () {
                                          setState(() {});
                                        },
                                        onTapOutside: (e) {
                                          setState(() {});
                                        },
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email  ",
                                            hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    174, 201, 201, 201),
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.pushNamed(
                                      context, signInScreenRoute);
                                }),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFABCA43)),
                                  child: Container(
                                    child: state.loading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 3,
                                            ),
                                          )
                                        : const Center(
                                            child: Text("Demande de badge ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                )),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      'assets/svgs/dots.svg',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ])));
      },
    );
  }
}
