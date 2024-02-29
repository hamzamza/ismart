import 'package:flutter/material.dart';
import 'package:ismart/features/account/widgets/AbonnementCard.dart';
import 'package:ismart/features/account/widgets/PersonalInfocontaner.dart';
import 'package:ismart/features/account/widgets/ProfilePicture.dart';
import 'package:ismart/features/account/widgets/SeparatingLine.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 10);
  bool receiveNewsletter = false;
  bool notification = false;
  String speedUnity = "km/h"; // "mph"
  String distanceUnity = "km"; // "miles"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Compte",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        padding: padding,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: ProfilePicture(
                borderRadius: 65,
                imageUrl: 'assets/images/profile.jpeg',
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "zouhirmoh@gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 45),
            const Center(
              child: Text(
                "ABONNEMENTS",
                style: TextStyle(
                  color: Color.fromARGB(255, 138, 138, 138),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AbonnementCard(
              title: "Abonnement Ev-Ismart",
              text: "Faite des économies sur vos recharges rapides ",
              imageUrl: "assets/images/pngegg.png",
              onPress: () {},
            ),
            const SizedBox(height: 10),
            AbonnementCard(
              title: "Ev-Ismart Plus ",
              text: "Supprimez les pubs dans votre app EV-Ismart ",
              imageUrl: "assets/images/plus.png",
              onPress: () {},
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "VOTRE COMPTE",
                style: TextStyle(
                  color: Color.fromARGB(255, 138, 138, 138),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  PersonalInfoContainer(
                    text: "Informations personnelles ",
                    iconData: Icons.person,
                    onTap: () {},
                  ),
                  const SeparatingLine(),
                  const SizedBox(height: 10),
                  PersonalInfoContainer(
                    text: "Mot de passe ",
                    iconData: Icons.lock,
                    onTap: () {},
                  ),
                  const SeparatingLine(),
                  const SizedBox(height: 10),
                  PersonalInfoContainer(
                    text: "Véhicules ",
                    iconData: Icons.car_crash,
                    onTap: () {},
                  ),
                  const SeparatingLine(),
                  const SizedBox(height: 10),
                  PersonalInfoContainer(
                    text: "Informations de group ",
                    iconData: Icons.group,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "RÉGLAGE",
                style: TextStyle(
                  color: Color.fromARGB(255, 138, 138, 138),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("   Recevoir la newsletter "),
                  Switch(
                    inactiveThumbColor:
                        const Color.fromARGB(255, 107, 107, 107),
                    inactiveTrackColor: Colors.white,
                    activeColor: const Color.fromARGB(255, 107, 107, 107),
                    value: receiveNewsletter,
                    onChanged: (value) {
                      setState(() {
                        receiveNewsletter = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                    Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 25, 149, 250),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Notifications "),
                  ]),
                  Switch(
                    inactiveThumbColor:
                        const Color.fromARGB(255, 107, 107, 107),
                    inactiveTrackColor: Colors.white,
                    activeColor: const Color.fromARGB(255, 107, 107, 107),
                    value: notification,
                    onChanged: (value) {
                      setState(() {
                        notification = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "UNITÉ",
                style: TextStyle(
                  color: Color.fromARGB(255, 138, 138, 138),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          speedUnity = "km/h";
                        });
                      },
                      child: Container(
                        decoration: speedUnity == "km/h"
                            ? BoxDecoration(
                                color: const Color.fromARGB(255, 233, 246, 255),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 160, 153, 255),
                                  width: 0.8,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              )
                            : const BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text("km/h"),
                        ),
                      ),
                    ),
                  ),
                  //  String speedUnity = "km/h"; // "mph"
                  //String distanceUnity = "km"; // "miles"
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          speedUnity = "mph";
                        });
                      },
                      child: Container(
                        decoration: speedUnity == "mph"
                            ? BoxDecoration(
                                color: const Color.fromARGB(255, 233, 246, 255),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 160, 153, 255),
                                  width: 0.8,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              )
                            : const BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text("mph"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          distanceUnity = "km";
                        });
                      },
                      child: Container(
                        decoration: distanceUnity == "km"
                            ? BoxDecoration(
                                color: const Color.fromARGB(255, 233, 246, 255),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 160, 153, 255),
                                  width: 0.8,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              )
                            : const BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text("KM"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          distanceUnity = "miles";
                        });
                      },
                      child: Container(
                        decoration: distanceUnity == "miles"
                            ? BoxDecoration(
                                color: const Color.fromARGB(255, 233, 246, 255),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 160, 153, 255),
                                  width: 0.8,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              )
                            : const BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text("miles"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
