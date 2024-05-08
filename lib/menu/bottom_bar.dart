import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


import '../pages/eyaCV.page.dart';
import '../pages/home.page.dart';
import '../pages/wassimCV.page.dart';


class BottomBar extends StatefulWidget {


  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    WassimCVPage(),
    EyaCVPage(),

  ];
  final List<Color> _colors = [
    Colors.black45,
    Colors.teal.shade400,
    Colors.yellow.shade800,
    //Color.alphaBlend(Colors.orange,Colors.greenAccent),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: _colors[_currentIndex],
          activeColor: Colors.white,
          //  height:;
          height: 60,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.man, title: 'Wassim CV'),
            TabItem(icon: Icons.woman, title: 'Eya CV'),

          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        )
    );
  }
}
