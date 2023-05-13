import 'package:chuck_norris_application/services/colors.dart';
import 'package:chuck_norris_application/views/joke_page.dart';
import 'package:flutter/material.dart';
import '../views/categories_page.dart';
import '../views/home_page.dart';
import 'package:http/http.dart' as http;

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    CategoriesPage(httpClient_: http.Client()),
    JokePage(httpClient_: http.Client())
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: COLOR_BLACK_4),
            ),
            color: Colors.white),
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedFontSize: 13,
          iconSize: 32,
          selectedItemColor: COLOR_BLACK,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home page',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sort),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shuffle),
              label: 'Random joke',
            )
          ],
        ),
      ),
    );
  }
}
