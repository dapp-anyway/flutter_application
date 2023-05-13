import 'package:chuck_norris_application/models/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../services/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset("assets/images/chuck.png")),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text(
              "Do you have any idea who Chuck Norris is?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: COLOR_BLACK,
                height: 1.3,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              "Carlos Ray «Chuck» Norris (born March 10, 1940) is an American martial artist and actor. He is a black belt in Tang Soo Do, Brazilian jiu jitsu and judo.[1] After serving in the United States Air Force, Norris won many martial arts championships and later founded his own discipline Chun Kuk Do. Shortly after, in Hollywood, Norris trained celebrities in martial arts. Norris went on to appear in a minor role in the spy film The Wrecking Crew (1969). Friend and fellow martial artist Bruce Lee invited him to play one of the main villains in Way of the Dragon (1972). While Norris continued acting, friend and student Steve McQueen suggested him to take it seriously. Norris took the starring role in the action film Breaker! Breaker! (1977), which turned a profit. His second lead Good Guys Wear Black (1978) became a hit, and he soon became a popular action film star",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: COLOR_BLACK,
                height: 1.6,
              ),
            ),
            // const Padding(padding: EdgeInsets.only(top: 10)),
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Text(
              "A little about application",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: COLOR_BLACK,
                height: 1.3,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              "This is an application where you can be inspired by the brilliant jokes of the genius Chuck Norris",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: COLOR_BLACK,
                height: 1.6,
              ),
            ),
          ],
        ),
        appBar: const CustomAppBar(
          title: "Chuck Norris Jokes",
        ));
  }
}
