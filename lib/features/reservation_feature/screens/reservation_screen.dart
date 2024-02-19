import 'package:flutter/material.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);
// this is normay a reservation screen i will consider it for now a offers screen
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 210,
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/chargingbackground.jpg'),
                )),
                child: const Center(
                  child: Text(
                    "DES FORFAITS D'ABONNEMENT ADAPTÉS À VOTRE BESOIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Color.fromARGB(200, 0, 0, 0),
                          spreadRadius: 8,
                          blurRadius: 9,
                          offset: Offset(2, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 240,
                left: 0,
                right: 0,
                child: Column(
                  children: const [
                    _Abbonementcard(
                      name: 'PULSE ',
                      prix30jours: 800,
                      prix7jours: 250,
                      recharges: 5,
                      backgroundColor: Color.fromARGB(255, 34, 34, 34),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _Abbonementcard(
                        name: 'PRIVILÉGE',
                        prix30jours: 1000,
                        prix7jours: 300,
                        recharges: 8,
                        backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                  ],
                ))
          ],
        ));
  }
}

class _Abbonementcard extends StatelessWidget {
  final String name;
  final double prix7jours;
  final double prix30jours;
  final Color backgroundColor;
  final int recharges;
  const _Abbonementcard({
    required this.name,
    required this.prix30jours,
    required this.recharges,
    required this.prix7jours,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4, right: 20, left: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(45, 0, 0, 0),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 200,
                width: 4,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 136, 5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text(
                                    "$recharges   recharges  ",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 18, 105, 0)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(132, 67, 185, 63),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(1,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Pendant",
                                          style: textstyleed,
                                        ),
                                        const Text("7 jours à ",
                                            style: textstyleed),
                                        Text("$prix7jours DH",
                                            style: textstyleed)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(132, 67, 185, 63),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Pendant",
                                          style: textstyleed,
                                        ),
                                        const Text(
                                          "30 jours à ",
                                          style: textstyleed,
                                        ),
                                        Text(
                                          "$prix30jours DH",
                                          style: textstyleed,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const textstyleed = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 58, 58, 58));
