import 'package:flutter/material.dart';
import 'package:ismart/features/account/widgets/cardrediamge.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Compte",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                )),
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: ProfilePicture(
              borderRadius: 65,
              imageUrl: 'assets/images/profile.jpeg',
            )),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text("zouhirmoh@gmail.com",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ))),
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text("ABONNEMENTS",
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 99, 99),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ))),
            const SizedBox(
              height: 10,
            ),

            ///
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profile.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [Text("data"), Text('data')],
                    )
                  ],
                )),

            ///

            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profile.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text("data")
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
