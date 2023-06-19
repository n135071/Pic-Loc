import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../history/history_screens.dart';
import 'home_screen.dart';

class Bottom extends StatelessWidget {
  final int currentIndex;

  const Bottom({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    return CurvedNavigationBar(
      backgroundColor: Colors.blue,
      animationCurve: Curves.slowMiddle,
      animationDuration: const Duration(milliseconds: 100),
      key: bottomNavigationKey,
      index: currentIndex,
      letIndexChange: (index) => true,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()));
        }
      },
      items: <Widget>[
        Column(
          children: const [
            Icon(Icons.home),
            Text('Home'),
          ],
        ),
        Column(
          children: const [
            Icon(Icons.history),
            Text('History'),
          ],
        ),
      ],
    );
  }
}
